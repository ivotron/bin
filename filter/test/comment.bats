#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/event.json"

@test "comment: matches" {
  run comment lgtm
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "comment: does not match" {
  run comment lbtm
  [ "$status" -eq 78 ]
  echo $output
  [ "$output" = "comment is \"lgtm\", not \"lbtm\"" ]
}