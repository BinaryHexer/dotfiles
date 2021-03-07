#!/usr/bin/env bash
set -euxo pipefail

TMP_LOGFILE=$(mktemp /tmp/dotfiles_log.XXXXXX)

is_executable() {
    type "$1" >/dev/null 2>&1
}

get_download_cmd() {
    local target=$1
    local source="https://github.com/BinaryHexer/dotfiles"
    local tarball="${source}/tarball/master"
    local tar_cmd="tar -xzv -C "${target}" --strip-components=1 --exclude='{.gitignore}'"
    local cmd=""

    if is_executable "git"; then
        cmd="git clone ${source} ${target}"
    elif is_executable "curl"; then
        cmd="curl -#L ${tarball} | ${tar_cmd}"
    elif is_executable "wget"; then
        cmd="wget --no-check-certificate -O - ${tarball} | ${tar_cmd}"
    fi

    echo "$cmd"
}

download_repo() {
    local target=$1
    local cmd=$(get_download_cmd "${target}")

    if [ -z "$cmd" ]; then
        echo "No git, curl or wget available. Aborting."
    else
        echo "Downloading dotfiles..."
        mkdir -p "${target}"
        eval "${cmd}"
    fi
}

install_xcode() {
    sudo softwareupdate -i -a

    echo "Installing XCode command line tools..."

    if xcode-select --print-path &>/dev/null; then
        echo "XCode command line tools already installed."
    elif xcode-select --install &>/dev/null; then
        echo "Finished installing XCode command line tools."
    else
        echo "Failed to install XCode command line tools."
    fi
}

main() {
    local target="$HOME/.dotfiles"
    # 1. Download the repo
    download_repo "${target}"
    # 2. Prompt for password
    if [ -z "${GITHUB_ACTION+x}" ]; then
        echo "Prompting for sudo password..."
        if sudo -v; then
            # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
            while true; do
                sudo -n true
                sleep 60
                kill -0 "$$" || exit
            done 2>/dev/null &
            echo "Sudo credentials updated."
        else
            echo "Failed to obtain sudo credentials."
        fi
    fi
    # 3. Install xcode (includes make)
    install_xcode
    # 4. Execute make
    cd "${target}"; make
}

echo "Logfile: ${TMP_LOGFILE}"

main 2>&1 | tee -a "${TMP_LOGFILE}"

echo "Logfile: ${TMP_LOGFILE}"
