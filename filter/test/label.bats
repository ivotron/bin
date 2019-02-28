#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/event.json"

@test "label: matches" {
  run label urgent
  [ "$status" -eq 0 ]
}

@test "label: matches pull request" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/pull_request_event.json"
  run label urgent
  [ "$status" -eq 0 ]
}

@test "label: matches all" {
  run label urgent bug
  [ "$status" -eq 0 ]
}

@test "label: does not match" {
  run label feature
  [ "$status" -eq 78 ]
}

@test "label: does not match all" {
  run label urgent feature
  [ "$status" -eq 78 ]
}


@test "label: does not match when no label" {
  export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/empty_event.json"
  run label feature
  [ "$status" -eq 78 ]
}
