#!/bin/bash

#-------------------=== Colors ===-------------------------------
# \[\033[<num_for_syle>;<num_for_color>m\] = color
# e.g: \[\033[02;32m\] = green text in italics
# \[\033[00m\]
invisible="\[\033[01;30m\]"
white="\[\033[00m\]"
green="\[\033[01;32m\]"
red="\[\033[01;31m\]"
yellow="\[\033[01;33m\]"
blue="\[\033[01;34m\]"
purple="\[\033[01;35m\]"
cyan="\[\033[01;36m\]"

bright_white="\[\033[01;37m\]"
white_text_over_red="\[\033[01;41m\]"
white_text_over_gree="\[\033[01;42m\]"
white_text_over_yellow="\[\033[01;43m\]"
white_text_over_blue="\[\033[01;43m\]"
white_text_over_purple="\[\033[01;43m\]"
white_text_over_cyan="\[\033[01;43m\]"
white_text_over_gray="\[\033[01;43m\]"
white_text_over_yellow="\[\033[01;43m\]"



#-------------------=== Vars ===-------------------------------
success_symbol="❯"
error_symbol="✗"
out=""
PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\]"
# PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\] >\[\033[00m\] "



function exit_status() {
    if [ "$?" == "0" ]; then
        echo -e '${green}${success_symbol}'
    else
        echo -e '${red}${error_symbol}'
    fi
}


function __init() {
    # PS1="$PS1 `smiley`${white} "
    PS1="$PS1 ${success_symbol}${white} "
}


__init
