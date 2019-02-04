#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_ACTOR="octocat"

@test "exclude: actor matches turns into no match" {
  run exclude actor octocat
  echo $output
  [ "$status" -eq 78 ]
  [ "$output" = "excluding match" ]
}

@test "exclude: actor does not match turns into match" {
  run exclude actor nat
  echo $output
  [ "$status" -eq 0 ]
  [ "$output" = "excluding non-match: actor is \"octocat\", not any of \"nat\"" ]
}

@test "exclude: preserves other exit codes" {
  run exclude exit 100
  echo $output
  [ "$status" -eq 100 ]
  [ "$output" = "" ]
}
