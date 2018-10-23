#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/event.json"

@test "issue-user: matches" {
  run user issue-user
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "pr-user: matches" {
  run user pr-user
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "issue-user: does not match" {
  run user some-other-user
  [ "$status" -eq 1 ]
  echo $output
  [ "$output" = "user does not match \"some-other-user\"" ]
}
