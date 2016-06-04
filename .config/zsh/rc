autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

source_nix () {
    local nix_profile

    nix_profile="$HOME/.nix-profile/etc/profile.d/nix.sh"
    [[ -e $nix_profile ]] && . "$nix_profile"
}

function wp() {
    awsetbg -r $HOME/Pictures
}


source_nix
