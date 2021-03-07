#!/usr/bin/env bash
set -euxo pipefail

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Applications/Slack.app"
dockutil --no-restart --add "/System/Applications/Brave.app"
dockutil --no-restart --add "/System/Applications/iTerm.app"

killall Dock