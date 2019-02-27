#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_tag_event.json"

@test "deleted_tag: without a event file" {
  unset GITHUB_EVENT_PATH
  run deleted_tag
  [ "$status" -eq 1 ]
  [ "$output" = "\$GITHUB_EVENT_PATH is not set" ]
}

@test "deleted_tag: ref_type is a tag" {
  run deleted_tag
  [ "$status" -eq 0 ]
  [ "$output" = "matches *" ]
}

@test "deleted_tag: ref_type is a branch" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_branch_event.json"
  run deleted_tag
  [ "$status" -eq 78 ]
  [ "$output" = "ref_type is not a tag: branch" ]
}

@test "deleted_tag: matches" {
  run deleted_tag v1*
  [ "$status" -eq 0 ]
  [ "$output" = "matches v1*" ]
}

@test "deleted_tag: does not match" {
  run deleted_tag release-*
  [ "$status" -eq 78 ]
  [ "$output" = "does not match release-*" ]
}
