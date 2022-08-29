# Set LANG
set -x -g LC_ALL en_GB.UTF-8
set -x -g LANG en_GB.UTF-8

# Set PATH
set -x -g PATH ~/bin /usr/local/bin /usr/local/sbin $PATH

# Homebrew is installed on different path on Apple Silicon
set aarch (uname -m)
if test aarch = 'arm64'
    set -x -g PATH /opt/homebrew/bin $PATH
end

# JAVA
set -x -g JAVA_8_HOME (/usr/libexec/java_home -v1.8)
set -x -g JAVA_LT_HOME (/usr/libexec/java_home -v11)

# GO
set -x -g GOPATH ~/dev/go/bin
set -x -g GOPRIVATE github.com/my-private-org
set -x -g PATH $PATH ~/dev/go/bin

# RUST
set -x -g PATH $PATH ~/dev/rust/cargo/bin

# KUBECTL
set -x -g KUBECONFIG ~/.config/kube/config.yaml

# Init thefuck
thefuck --alias | source

# Gcloud
if test aarch = 'arm64'
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
else
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end

# GPG
set -x -g GPG_TTY (tty)

# Change the default location of starship config
set -x -g STARSHIP_CONFIG ~/.config/starship/config.toml

# Init starship shell
starship init fish | source
