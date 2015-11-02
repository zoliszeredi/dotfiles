#! /usr/bin/env bash

install_nix () {
    local nix_profile nix_install

    nix_profile="$HOME/.nix-profile/etc/profile.d/nix.sh"
    nix_install="https://nixos.org/nix/install"
    [[ $(which curl) ]] || sudo apt-get install -y curl
    [[ -e "$nix_profile" ]] || bash <(curl $nix_install)
    . "$nix_profile"
}

clone_repo () {
    local repo repo_url git_command

    repo_url=$1
    repo=$2
    repo_parent=$(dirname "$repo")
    git_command="git clone $repo_url $repo"
    [[ -d "$repo_parent" ]] || mkdir -p "$repo_parent"
    [[ -d "$repo" ]] || nix-shell '<nixpkgs>' --packages git \
                                              --command "$git_command"
}

copy_verbose () {
    local sources destination

    destination=$1
    shift
    sources=$*
    [[ ! -d $destination ]] && mkdir -p "$destination"
    for entry in $sources; do
    	copy_command="cp -Rf $entry $destination"
        echo "$copy_command"
        $copy_command
    done
}

main () {
    local repo_url repo binfiles dotfiles

    repo_url="https://github.com/zoliszeredi/dotfiles"
    repo="$HOME/source/dotfiles"
    install_nix

    clone_repo "$repo_url" "$repo"
    dotfiles=$(find "$repo" -type f -name '\.*' -maxdepth 1)
    binfiles=$(find "$repo/bin" -type f -maxdepth 1)
    copy_verbose "$HOME/" "$dotfiles"
    copy_verbose "$HOME/bin/" "$binfiles"
}

main
