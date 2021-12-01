#!/usr/bin/env bash
set -e

echo "I'm doing linting! Add your commands here"

if [[ -z "${TEST_VAR}" ]]; then
  echo "TEST_VAR env var wasn't set"
  exit 1
else
  echo "TEST_VAR is saying: ${TEST_VAR}"
fi

