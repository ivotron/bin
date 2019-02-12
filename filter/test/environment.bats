#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/deployment.json"

@test "environment: matches" {
  run environment production
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "environment: does not match" {
  run environment staging
  [ "$status" -eq 78 ]
  [ "$output" = "environment does not match" ]
}

@test "environment: matches a or b" {
  run environment "production|staging"
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "environment: does not match a or b" {
  run environment "development|staging"
  [ "$status" -eq 78 ]
  [ "$output" = "environment does not match" ]
}
