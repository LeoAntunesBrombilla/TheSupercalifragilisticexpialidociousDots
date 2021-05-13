# Installation Manual

## Synopsis

```
bash install.sh [flags]
```

## Description

This script installs all many utils, packages and configuration used on my daily programming life

## Installation

The `dev` branch always contains the latest version of this file. Although I strongly recommend following the steps on the [README.md](https://github.com/kdav5758/.dotfiles/blob/dev/README.md) file for installation.

## Flags

```
-h, --help
    Print install.sh help message and exit.

-iw, --install-wallpapers
    Download and install two wallpapers from imgur.com

-iu, --install-utils
    Install all the utilities present in the apt_manual_list.txt

-gl, --generate-list
    Update the list apt_manual_list.txt with any new pkgs isntalled from apt

-ar, --add-repos
    Add main source repositories. There are 4 main repositories:
        1. main
        2. universe
        3. restricted
        4. multiverse
-bs, --bin-symlinks
    Create symlinks between files from the repo's /bin/ to /usr/local/bin/

-ap, --add-ppas
    Add Important PPAs needed to install certain utilities/apps

-uf, --update-files
    Update dotfiles to the local ones. Useful if you'd rather stay with your dotfiles

-ia, --install-apps
    Install several apps shown above

-nd, --nvidia-drivers
    Install latest nvidia drivers (460, 10-03-21)

-gp, --give-permissions
    Give permissions over certain directories. (needed for installing several things)
```


