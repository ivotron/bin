#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_ACTOR="octocat"

@test "not: actor matches turns into no match" {
  run not actor octocat
  echo $output
  [ "$status" -eq 78 ]
  [ "$output" = "reversing match" ]
}

@test "not: actor does not match turns into match" {
  run not actor nat
  echo $output
  [ "$status" -eq 0 ]
  [ "$output" = "reversing non-match: actor is \"octocat\", not any of \"nat\"" ]
}

@test "not: preserves other exit codes" {
  run not exit 100
  echo $output
  [ "$status" -eq 100 ]
  [ "$output" = "" ]
}

@test "not: nothing to reverse" {
  run not
  echo $output
  [ "$status" -eq 1 ]
  [ "$output" = "nothing to reverse" ]
}

