#!/usr/bin/env bash
set -euxo pipefail

BREW_PATH="/usr/local"
if [[ $(uname -m) == 'arm64' ]]; then
  SHELL_PATH="/opt/homebrew"
fi

sudo ln -sfn "${BREW_PATH}/opt/openjdk/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -sfn "${BREW_PATH}/opt/openjdk@8/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk-8.jdk
