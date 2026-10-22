#!/bin/sh
set -e

mkdir -p /home/container/actions-runner
cd /home/container/actions-runner

if [ ! -f config.sh ]; then
    WORKER_VERSION=$(/worker/curl_latest_tag.sh)
    echo "Deploying GitHub Runner Version: ${WORKER_VERSION}"

    curl -o actions-runner-linux-x64-latest.tar.gz -L \
      "https://github.com/actions/runner/releases/download/v${WORKER_VERSION}/actions-runner-linux-x64-${WORKER_VERSION}.tar.gz"

    tar xzf actions-runner-linux-x64-latest.tar.gz
    rm actions-runner-linux-x64-latest.tar.gz
fi

if [ ! -f .runner ]; then
    ./config.sh --url "${REPO_URL}" --token "${REG_TOKEN}" --unattended --work _work --replace
fi

exec ./run.sh