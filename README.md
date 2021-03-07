# Dotfiles

Dotfiles customized for macOS setup.

# Installation

1. (Optional) To initialize gcloud sdk and kubectl config, set the following env vars (replace the values as required):
```sh
export GCP_REGION="asia-east-1"
export GCP_CLUSTERS=(cluster-1 cluster-2)
export GCP_PROJECTS=(project-1 project-2)
```

2. Run the following shell command:
```sh
curl -fsSL https://raw.githubusercontent.com/BinaryHexer/dotfiles/master/install.sh | bash
```

# Contents

## Root (/)

- install.sh - Bootstrapping script
- Makefile - Main installation commands

## Bin (bin/)

- Some helper scripts

## Config (config/)

### Fish

- config.fish - Global fish configuration (.fishrc)
- fish_plugins - List of `fisher` plugins
- completions/
    - repo.fish - Contains all repos as completions for the repo command
    - repodir.fish - Contains all repos as completions for the repodir command
- functions/ 
    - repo.fish - Finds a repository in ~/dev and jumps to it
    - repodir.fish - Finds a repository in ~/dev and prints its path
    
### Git

- config - Sets several global Git variables
- ignore - Contains global gitignores, such as OS-specific files and several compiled files

### Hammerspoon

- apps.lua
- grid.lua
- init.lua

### Starship

- config.toml - Starship configuration file

### Thefuck

- settings.py - Settings for `thefuck` command

### Vim

- vimrc - Basic configuration for `vim`

### Vscodium

- keybindings.json - Sets the keybindings for vscodium
- settings.json - Sets the settings for vscodium

## Some highlighted CLIs

- [Bat](https://github.com/sharkdp/bat)
- [Broot](https://github.com/Canop/broot)
- [Fzf](https://github.com/junegunn/fzf)
- [JQ](https://github.com/stedolan/jq)
- [Peco](https://github.com/peco/peco)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Thefuck](https://github.com/nvbn/thefuck)
- [YQ](https://github.com/mikefarah/yq)

## Additional Resources

- [Fish](https://fishshell.com/)
- [Git](https://git-scm.com/)
- [Hammerspoon](https://github.com/Hammerspoon/hammerspoon)
- [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
- [Homebrew](https://brew.sh)
- [Starship](https://starship.rs/)
- [Stow](https://www.gnu.org/software/stow/)
- [VSCodium](https://vscodium.com/)

## Credits

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Rkalis's Dotfiles](https://github.com/rkalis/dotfiles)
