#!/bin/bash

LSP_BIN_PATH=$HOME/.local/bin
pfx="~~~~~~~~~~~~ "
banner="----------------------------↓↓--------------------------------"
this_scrpt=$(basename "$0")
__nvdelightful_verbosity=0

script_help=$(
    cat <<EOF

This script helps the user to install NeoVim-Delightful, my personal configuration for
NeoVim.

Usages:
	#0: ${this_scrpt} [arg(s)]
Arguments:
	-h,--help,-?,?				See this help message.
	-g,--installation			The installer will become noob friendly and will explain/show you the step by step installation process.
	-a,--all					Install everything.
	-s,--create-symlinks		Create symlinks between $(pwd) and ~/.config/nvim/
	-p,--packer					Install Packer.nvim plugin manager.
	-l,--language-servers		Install some language servers for Nvim's native LSP.

EOF
)

function complex_heading() {
    # echo -e "\n\n${banner}\n\t$(prompt -i "Language server for: '${1}'")\n${banner}"
    echo -e "\n\n"
    prompt -w "${banner}"
    echo -e "\t$(prompt -i "${1}")"
    prompt -w "${banner}"
}

function simple_heading() {
    echo -e "\n\n${pfx} ${1}"
}

function __nvdelightful_init_colors() {
    #COLORS
    CDEF=" \033[0m"      # default color
    CCIN=" \033[0;36m"   # info color
    CGSC=" \033[0;32m"   # success color
    CRER=" \033[0;31m"   # error color
    CWAR=" \033[0;33m"   # waring color
    b_CDEF=" \033[1;37m" # bold default color
    b_CCIN=" \033[1;36m" # bold info color
    b_CGSC=" \033[1;32m" # bold success color
    b_CRER=" \033[1;31m" # bold error color
    b_CWAR=" \033[1;33m" # bold warning color
}

function __nvdelightful_verbose_install() {
    if [[ ! $__nvdelightful_verbosity = 0 ]]; then
        tput bold
        echo -e "~~> ${1}"
        tput sgr0
    fi
}

function prompt() {
    case ${1} in
    "-s" | "--success")
        echo -e "${b_CGSC}${@/-s/}${CDEF}"
        ;; # print success message
    "-e" | "--error")
        echo -e "${b_CRER}${@/-e/}${CDEF}"
        ;; # print error message
    "-w" | "--warning")
        echo -e "${b_CWAR}${@/-w/}${CDEF}"
        ;; # print warning message
    "-i" | "--info")
        echo -e "${b_CCIN}${@/-i/}${CDEF}"
        ;; # print info message
    *)
        echo -e "$@"
        ;;
    esac
}

function has_command() {
    command -v $1 >/dev/null
}

function __nvdelightful_install() {

    complex_heading "Prerequisites..."
    prompt -i "Checking if NeoVim is installed..."

    if (has_command nvim); then
        prompt -s "Okay: NeoVim is installed"
    else
        prompt -w "Remember to install NeoVim after this"
    fi

    complex_heading "Previous nvim configs..."
    prompt -i "Checking if there are previous nvim configs..."

	# sudo rm -rf ~/.config/nvim
}

__nvdelightful_init_colors

if [[ -n "$1" ]]; then
    for arg in "$@"; do
        case "$arg" in
        -h | -\? | ? | --help)
            echo "$script_help"
            exit 0
            ;;
        -i | --install)
            __nvdelightful_install
            ;;
        *)
            echo -e "Command $arg was not recognized, type '$this_scrpt --help' to see the available commands"
            exit 1
            ;;
        esac
    done
else
    echo -e "This script needs at least one argument to work.\nType $this_scrpt --help' for help "
fi
