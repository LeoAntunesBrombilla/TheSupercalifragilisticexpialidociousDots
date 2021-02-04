#!/bin/bash

#-------------------=== configs ===-------------------------------
this_script=`basename "$0"`
installed_packages="apt_manual_list.txt"
script_help=$( cat << EOF

This script installs all many utils, packages and configuration used on my daily programming
life.

Usages:
    #0: ${this_script} [arg]
Arguments:
    -h,--help                                   See this help message.
    -g,--generate-list                          Create list of insatlled dependencies
EOF
)

#-------------------=== script ===-------------------------------

function update_files() {   #updates .dotfiles cat-ting current ones into the ones in the local repo
    `cat ~/.vimrc > dotfiles/vim/.vimrc`; `cat ~/.config/nvim/init.vim > dotfiles/vim/init.vim`     #vim & nvim
    `cat ~/.bashrc > dotfiles/shell/.bashrc`                                                        #.bashrc
    `cat ~/.config/kitty/kitty.conf > dotfiles/kitty/kitty.conf`                                    #kitty
    `cat ~/.inputrc > dotfiles/user/.inputrc`; `cat ~/.profile > dotfiles/user/.profile`            #user
}


if [[ -n "$1" ]]; then
    case "$1" in
        -h|--help)
            echo "$script_help"; exit 0
            ;;
        -g|--generate-list) #list installed packages into a file
            `apt-mark showmanual > $installed_packages`
            exit 0
            ;;
        -u|--update-files)
            update_files

            case ${?} in
                0)
                    echo -e "\nAll files where updated successfully!\n"
                    ;;
                *)
                    echo -e "\nAn unknown error occurred while updating files. Please check that you have the appropriate permissions for viewing them\n"
                    exit 1
                    ;;
            esac

            exit 0
            ;;
        *)
            echo -e "The give command '$1' was not recognized. Run ./$this_script --help to see which are the available commands\n"
            exit 1
            ;;
    esac
    shift
else
    echo -e "This file needs at least one argument to execute. Run ./$this_script --help to see which are the available commands\n"
    exit 1
fi
