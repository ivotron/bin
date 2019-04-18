#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

@test "deleted: without an event file" {
  unset GITHUB_EVENT_PATH
  run deleted
  [ "$status" -eq 1 ]
  [ "$output" = "\$GITHUB_EVENT_PATH is not set" ]
}

@test "deleted: event deletes a branch" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_branch_event.json"
  run deleted
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "deleted: event deletes a tag" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/delete_tag_event.json"
  run deleted
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "deleted: not delete event" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/empty_event.json"
  run deleted
  [ "$status" -eq 78 ]
  [ "$output" = "Event does not delete a branch or tag." ]
}
