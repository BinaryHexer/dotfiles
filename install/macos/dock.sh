#!/usr/bin/env bash
set -euxo pipefail

DLURL=$(curl --silent "https://api.github.com/repos/kcrawford/dockutil/releases/latest" | jq -r '.assets[].browser_download_url' | grep pkg)
curl -sL ${DLURL} -o /tmp/dockutil.pkg
sudo installer -pkg "/tmp/dockutil.pkg" -target /
rm /tmp/dockutil.pkg

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/iTerm.app"

killall Dock