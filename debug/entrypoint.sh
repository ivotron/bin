#!/bin/sh

set -e

echo
echo
echo "### Environment"
echo
echo
env | sort -f
echo
echo
echo "### $GITHUB_EVENT_PATH"
jq . < "$GITHUB_EVENT_PATH" # run through jq to pretty print
echo
echo

# Run any commands passed
if [ $# -ne 0 ]; then
  exec "$@"
fi
