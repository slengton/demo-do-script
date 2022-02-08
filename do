#!/usr/bin/env bash

## dev-install: Install tools needed for development
function task_dev_install {
    asdf install
}

## build: Build application
function task_build {
    ./gradlew clean build
}

## run: Run application using gradle
function run {
    ./gradlew bootRun
}

## docker-build: Build docker image
function task_docker_build {
    task_build
    docker build -t demo .
}

## docker-run: Run demo within a docker container
function task_docker_run {
    task_docker_build
    docker run -d -p 8080:8080 demo
}

function task_usage {
  echo "Usage: $0"
  sed -n 's/^##//p' <$0 | # print every line that starts with '##'
  column -t -s ':' | # creates a table with columns split by ':'
  sed -E $'s/^/\t/' # indent each line
}

CMD=${1:-}
shift || true

RESOLVED_COMMAND=$(echo "task_"$CMD | sed 's/-/_/g') # transform command to function name, e.g. docker-run -> task_docker_run
if [ "$(LC_ALL=C type -t $RESOLVED_COMMAND)" == "function" ]; then # check if the resolved function exists
    pushd $(dirname "${BASH_SOURCE[0]}") >/dev/null # allow script to be run from outside
    $RESOLVED_COMMAND "$@" # execute the task
    popd >/dev/null # go back to dir where script was called
else
    task_usage
fi