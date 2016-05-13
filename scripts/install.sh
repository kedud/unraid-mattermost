#!/bin/bash

# exit script if return code != 0
set -e

export DEBIAN_FRONTEND=noninteractive

# Install deps
apt-get -q update
apt-get install -qy wget supervisor

# Install matermost
wget --no-verbose -P /tmp "https://releases.mattermost.com/${VERSION}/mattermost-team-${VERSION}-linux-amd64.tar.gz"
tar -xvzf /tmp/mattermost-team-${VERSION}-linux-amd64.tar.gz --directory /opt

# clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
