SHELL = /bin/bash
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
OS := $(shell bin/is-supported bin/is-macos macos linux)
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NEW_SHELL := fish

export XDG_CONFIG_HOME = $(HOME)/.config
export STOW_DIR = $(DOTFILES_DIR)
export ACCEPT_EULA=Y

.PHONY: test

all: $(OS)

macos: core-macos packages-macos link post-macos

linux: core-linux packages-linux link post-linux

core-macos: ;

core-linux:
	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

packages-macos: brew-packages cask-apps

packages-linux: ;

link: stow-$(OS)
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(XDG_CONFIG_HOME) config

unlink: stow-$(OS)
	stow --delete -t $(XDG_CONFIG_HOME) config

post-macos: setup-macos new-shell gcloud

post-linux: ;

brew:
	is-executable brew || bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

stow-macos: brew
	is-executable stow || brew install stow

stow-linux: core-linux
	is-executable stow || apt-get -y install stow

brew-packages: brew
	brew analytics off
	brew bundle --file=$(DOTFILES_DIR)/install/homebrew/Brewfile

cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)/install/homebrew/Caskfile || true
	brew bundle --file=$(DOTFILES_DIR)/install/homebrew/Tapfile || true
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
	sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
	defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
	for EXT in $$(cat install/vscodium/extensions); do code --install-extension $$EXT; done

setup-macos:
	./install/macos/setup.sh || true
	./install/macos/dock.sh || true

new-shell:
	if [ -z "$${GITHUB_ACTION+x}" ]; then \
		./bin/set-shell $(NEW_SHELL); \
	fi

gcloud:
	if [ -z "$${GITHUB_ACTION+x}" ]; then \
		./install/gcloud/setup.sh; \
	fi

test:
	bats test