#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "I am inside the docker container "

yamllint --version

yamllint -c "/config.yaml" --format "parsable" ${INPUT_YAMLLINT_FLAGS:-'.'} \
  | reviewdog -efm="%f:%l:%c: %m" -name "yamllint" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
