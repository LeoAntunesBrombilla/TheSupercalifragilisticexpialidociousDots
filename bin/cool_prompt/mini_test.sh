#!/bin/bash

# Colors
light_green="\[\e[1;32m\]"
light_red="\[\e[1;31m\]"
yellow="\[\e[0;33m\]"
gray="\[\e[0;37m\]"
reset="\[\e[m\]"

# failed
# title='echo -en "\033]0; $(pwd) \a"'

# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }

# function set-title() {
#     if [[ -z "$ORIG" ]]; then
#         ORIG=$PS1
#     fi
#     TITLE="\[\e]2;$*\a\]"
#     PS1=${ORIG}${TITLE}
# }

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function prompt_command() {
    local status="$?"
    local status_color=""
    if [ $status != 0 ]; then
        status_color=$light_red
    else
        status_color=$light_green
    fi

    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

    if [ "$inside_git_repo" ]; then
        # echo "inside git repo"
        export PS1="[${yellow}\w${reset}]${gray}${reset}$(parse_git_branch)${status_color}λ${reset} "
    else
        # echo "not in git repo"
        export PS1="[${yellow}\w${reset}]${gray}${reset} ${status_color}λ${reset} "
    fi

    # if [ -d .git ]; then
    #     export PS1="[${yellow}\w${reset}]${gray}${reset}$(parse_git_branch)${status_color}λ${reset} "
    #     # echo .git;
    # else
    #     export PS1="[${yellow}\w${reset}]${gray}${reset} ${status_color}λ${reset} "
    # fi

    # export PS1="[${yellow}\w${reset}]${gray}${reset}$(parse_git_branch)${status_color}λ${reset} "
}

function __init() {
    export PROMPT_COMMAND=prompt_command
    # set-title "hello"
    # set-title ${PWD/"$HOME"/"~"}
}

__init



# kinda of works, tho it doesn't set the win tittle
# export PROMPT_COMMAND='`prompt_command`echo -en "\033]0; $("pwd") \a"'


