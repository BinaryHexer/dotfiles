#!/usr/bin/env bash
set -euxo pipefail

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/iTerm.app"

killall Dock