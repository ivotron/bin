#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/issue_comment.event.json"

@test "issue_comment: matches" {
  run issue_comment "You are totally right! I'll get this fixed right away."
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "issue_comment: does not match" {
  run issue_comment "You are totally right!"
  [ "$status" -eq 78 ]
  echo $output
  [ "$output" = "issue_comment is \"You are totally right! I'll get this fixed right away.\", not \"You are totally right!\"" ]
}