#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/pull_request_event.json"

@test "merged: matches" {
  run merged false
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "merged: does not match" {
  run merged true
  [ "$status" -eq 78 ]
  [ "$output" = "merged is \"false\", not \"true\"" ]
}

@test "merged: matches a or b" {
  run merged "true|false"
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "merged: does not match a or b" {
  run merged "edited|deleted"
  [ "$status" -eq 78 ]
  [ "$output" = "merged is \"false\", not \"edited|deleted\"" ]
}
