#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_branch_event.json"

@test "deleted_branch: without an event file" {
  unset GITHUB_EVENT_PATH
  run deleted_branch
  [ "$status" -eq 1 ]
  [ "$output" = "\$GITHUB_EVENT_PATH is not set" ]
}

@test "deleted_branch: ref_type is a branch" {
  run deleted_branch
  [ "$status" -eq 0 ]
  [ "$output" = "feature-new-command matches *" ]
}

@test "deleted_branch: ref_type is a tag" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_tag_event.json"
  run deleted_branch
  [ "$status" -eq 78 ]
  [ "$output" = "ref_type is not a branch: tag" ]
}

@test "deleted_branch: matches" {
  run deleted_branch feature-*
  [ "$status" -eq 0 ]
  [ "$output" = "feature-new-command matches feature-*" ]
}

@test "deleted_branch: does not match" {
  run deleted_branch release-*
  [ "$status" -eq 78 ]
  [ "$output" = "feature-new-command does not match release-*" ]
}
