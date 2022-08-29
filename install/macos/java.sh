#!/usr/bin/env bash
set -euxo pipefail

BREW_PATH="/usr/local"
if [[ $(uname -m) == 'arm64' ]]; then
  BREW_PATH="/opt/homebrew"
  # OpenJDK8 is not available for Apple Silicon, instead use Azul JDK8
  brew cask install zulu8
else
  sudo ln -sfn "${BREW_PATH}/opt/openjdk@8/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk-8.jdk
fi

sudo ln -sfn "${BREW_PATH}/opt/openjdk/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk
