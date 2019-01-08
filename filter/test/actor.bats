#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_ACTOR="octocat"

@test "actor: matches" {
  run actor octocat
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "actor: does not match" {
  run actor nat
  [ "$status" -eq 78 ]
  echo $output
  [ "$output" = "user/application which initiated the action was \"octocat\", not \"nat\"" ]
}

@test "actor: matches a or b" {
  run actor "nat|octocat"
  echo $output
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "actor: does not match a or b" {
  run actor "torvalds|nat"
  echo $output
  [ "$status" -eq 78 ]
  [ "$output" = "user/application which initiated the action was \"octocat\", not \"torvalds|nat\"" ]
}
