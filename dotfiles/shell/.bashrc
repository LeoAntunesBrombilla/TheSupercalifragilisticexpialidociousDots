# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1='\[\e]0;\u@\h: \w\a\]\[\033[4m\]\[\033[32m\]\u\[\033[0m\]\[\033[96m\]@\[\033[5m\]\[\033[33m\]\h\[\033[37m\]:\[\033[3m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    # PS1="\e[1;34m\e[3;29m\w\e[0m\e[0m \e[1;37m>\e[0m "

    # $USER@$DEVICE: <dir>$ <prompt>
    # PS1="\[\e]0;\u@\h: \w\a\]\[\033[4m\]\[\033[32m\]\u\[\033[0m\]\[\033[96m\]@\[\033[5m\]\[\033[33m\]\h\[\033[37m\]:\[\033[3m\]\[\033[01;34m\]\w\[\033[00m\]\$ \[\033[00m\]"

    # <dir> > <prompt>
    PS1="\[\033[01;32m\]\w\[\033[00m\]\[\033[01;39m\] >\[\033[00m\] "
    # PS1="\e[1;34m\e[3;32m\w\e[0m\e[0m \e[1;39m> \e[0m"
    # PS1="\e[1;34m\e[3;32m\w\e[0m\e[0m > "
    # PS1="\[\e]0;\u@\h: \w\a\]\e[1;34m\e[3;32m\w\e[0m\e[0m > "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# =============================================================================
# GitHub & Git
# =============================================================================

#-------------------=== Git aliases ===-------------------------------
alias 1tree='git log --all --decorate --oneline --graph'
alias 2tree='git log --all --decorate --graph'
alias ggs="git status"
alias ggch="git checkout"
alias ggpush="git push origin main"
alias ggpull="git pull origin main"
alias ggremote="git remote -v"  # check all remotes
alias ggbranch="git branch -v"  # check all branches


# =============================================================================
# XCLIP
# =============================================================================

#-------------------=== aliases ===-------------------------------
alias 'c=xclip' #copy
alias 'cc=xclip -selection clipboard' #copy to clipboard
alias 'v=xclip -o' #paste

# =============================================================================
# CHANGING CURSOR
# =============================================================================

#-------------------=== aliases ===-------------------------------
alias line='echo -e "\033[5 q"'         #blinking pipe bar
alias nbline='echo -e "\033[6 q"'       #not blinking pipe bar
alias block='echo -e "\033[1 q"'        #blinking block
alias nbblock='echo -e "\033[2 q"'      #not blinking block
alias uscore='echo -e "\033[3 q"'       #blinking underscore
alias nbuscore='echo -e "\033[4 q"'     #not blinking underscore


#-------------------=== nums info ===-------------------------------
# 1 is the blinky block cursor
# 2 is the default (non-blinky) block cursor
# 3 is blinky underscore
# 4 fixed underscore
# 5 pipe bar (blinking)
# 6 fixed pipe bar


# =============================================================================
# C-NET.ORG
# =============================================================================

#This for easy access on https://paste.c-net.org/

pastebin()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local file
        for file; do
            curl -s \
                --data-binary @"$file" \
                --header "X-FileName: ${file##*/}" \
                "$url"
        done
    else
        curl -s --data-binary @- "$url"
    fi
}
pasteget()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local arg
        for arg; do
            curl -s "${url}${arg##*/}"
        done
    else
        local arg
        while read -r arg; do
            curl -s "${url}${arg##*/}"
        done
    fi
}

# =============================================================================
# PYTHON
# =============================================================================

alias python="python3.8"

# =============================================================================
# JAVA
# =============================================================================

# visit this links in case you want to install java:
#   https://www.linode.com/docs/guides/how-to-install-openjdk-on-ubuntu-18-04/


#-------------------=== aliases ===-------------------------------
alias cjava='update-alternatives --config java' #change java version
alias scjava='sudo update-alternatives --config java' #change java version

#-------------------=== classpath(s) ===-------------------------------
#classpath for java (refer to linode for more info)
# in case you are getting an error or something with this whenever you open a new terminal session
# it's because you don't have java installed, and like so, this symblink does not work. If this is
# your case comment out the line below this comment.
_MY_JAVA="$(which java)"
if [ -e "${_MY_JAVA}" ]; then
    export JAVA_HOME=$(dirname $(dirname $(readlink -f "${_MY_JAVA}")))
    export PATH=$PATH:$JAVA_HOME/bin
fi
unset _MY_JAVA

# =============================================================================
# TERMINAL(S) MANAGEMENT
# =============================================================================

#-------------------=== aliases ===-------------------------------
#terminal aliases
#change default terminal
alias ctrm='update-alternatives --config x-terminal-emulator'
alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS'
alias gksudo='gksu'
alias sctrm='sudo update-alternatives --config x-terminal-emulator'
alias dtct_key="xev -event keyboard"
alias get_gtk='gsettings get org.gnome.desktop.interface gtk-theme'
alias eco='echo'
alias rm_crash='echo -e "\nThe following crashes were found and will now be removed:"; ls -l /var/crash/; sleep 1; sudo rm /var/crash/* && echo -e "\nMessage (OK): Succesfully cleared crashes!\nExit Status: $?" || echo -e "\nMessage (FAILED): No crashes were removed because A. there where none and/or B. You do not have permissions over this directory\nExit Status: $?"'


# you can add kitty (terminal) as an option with the following command
# `sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50`

#-------------------=== others ===-------------------------------
#for having 10,000 of history
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
alias tmp="cd /tmp"
#-------------------=== cd(s) ===-------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
#date formats
alias simple_date='date +"%d-%m-%y"'


#-------------------=== clear ===-------------------------------
alias cls="clear"
alias rlcea="clear"
alias cle="clear"
alias ecla="clear"
alias rclear="clear"
alias lscelar="clear"
alias ceear="clear"
alias celr="clear"
alias eclar="clear"
alias earl="clear"
alias clsad="clear"
alias ear="clear"
alias sclear="clear"
alias ealr="clear"
alias lsclear="clear"
alias cearlc="clear"
alias earlcea="clear"
alias clerr="clear"
alias rclea="clear"
alias lcas="clear"
alias clearcd="clear"
alias ckear="clear"
alias cela="clear"
alias earlc="clear"
alias clearlce="clear"
alias lear="clear"
alias caelr="clear"
alias lcea="clear"
alias rclea="clear"
alias caler="clear"
alias ceaar="clear"
alias slcea="clear"
alias cealr="clear"
alias elar="clear"
alias earls="clear"
alias cclear="clear"
alias clera="clear"
alias cleraa="clear"
alias clearra="clear"
alias claer="clear"
alias clrea="clear"
alias clra="clear"
alias celar="clear"
alias celalr="clear"
alias cear="clear"
alias clea="clear"
alias cls="clear; ls"
alias cearl="clear"
alias cler="clear"
alias CLEAR="clear"
alias cleer="clear"
alias cearlce="clear"
alias clearr="clear"
alias lcear="clear"
alias cealrc="clear"
alias clar="clear"
alias cearls="clear"

alias q="exit"
alias ks="ls"
alias LS="ls"
alias 1getip="ip route get 1.2.3.4 | awk '{print $7}'"
alias 2getip="hostname -I | awk '{print $1}'"
alias vom="vim"
alias co="cd out/; lh; cd .."
alias hl="lh"
alias pww="pwd"
alias getfm="cat /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy"
alias getfanmode="cat /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy"
alias gfm="cat /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy"

# fan modes:
#    + 2 = silent
#    + 0 = balance
#    + 1 = turbo


#And some for commonly used variations of ls (and typos):
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lha"
alias la="ls -la"
alias sl="ls"
#alias l="ls"
alias s="ls"



#mn: if you can't remember something use:
#history | grep foo
#this is for searching for 'foo'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Command line mplayer movie watching for the win.
#alias mp="mplayer -fs"

# Show me the size (sorted) of only the folders in this directory
alias dicts="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

#rsync
alias rsync_code="sudo rsync -av /home/sebas5758/code/ code1/"

# =============================================================================
# LUA
# =============================================================================

#-------------------=== aliases ===-------------------------------
alias lau="lua"
alias ual="lua"
alias aul="lua"
alias wlua="rlwrap lua"
alias xampp='gksu /opt/lampp/manager-linux-x64.run'
alias mp='mvn package'


# =============================================================================
# VIEWING & EDITING FILES
# =============================================================================

#-------------------=== Terminal Editors ===-------------------------------
alias nv='nvim'

#-------------------=== Exa ===-------------------------------
alias fe='exa -l -a --icons --sort=size --colour=auto --time-style=long-iso -F'
alias ef='fe'
alias fl='exa -F'


#-------------------=== w/ Vim ===-------------------------------

alias ef_systemd='sudo vim /etc/systemd/system.conf'
alias ef_kitty='vim ~/.config/kitty/kitty.conf'
alias ef_bash='vim ~/.bashrc'
alias ef_vim='vim ~/.vimrc'
alias ef_nvim='vim ~/.config/nvim/init.vim'
alias ef_ss='vim ~/.config/starship.toml'

#-------------------=== w/ Nvim ===-------------------------------

alias efn_systemd='sudo nvim /etc/systemd/system.conf'
alias efn_kitty='nvim ~/.config/kitty/kitty.conf'
alias efn_bash='nvim ~/.bashrc'
alias efn_vim='nvim ~/.vimrc'
alias efn_nvim='nvim ~/.config/nvim/init.vim'
alias efn_ss='nvim ~/.config/starship.toml'

#-------------------=== Cat-ting ===-------------------------------

alias ct_bash="cat ~/.bashrc"
alias ct_vim="cat ~/.vimrc"
alias ct_kitty="cat ~/.config/kitty/kitty.conf"
alias ct_nvim='cat ~/.config/kitty/kitty.conf'

# Git aliases

# setterm -foreground green -store
#
#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0232323" #black
#    echo -en "\e]P82B2B2B" #darkgrey
#    echo -en "\e]P1D75F5F" #darkred
#    echo -en "\e]P9E33636" #red
#    echo -en "\e]P287AF5F" #darkgreen
#    echo -en "\e]PA98E34D" #green
#    echo -en "\e]P3D7AF87" #brown
#    echo -en "\e]PBFFD75F" #yellow
#    echo -en "\e]P48787AF" #darkblue
#    echo -en "\e]PC7373C9" #blue
#    echo -en "\e]P5BD53A5" #darkmagenta
#    echo -en "\e]PDD633B2" #magenta
#    echo -en "\e]P65FAFAF" #darkcyan
#    echo -en "\e]PE44C9C9" #cyan
#    echo -en "\e]P7E5E5E5" #lightgrey
#    echo -en "\e]PFFFFFFF" #white
#    clear #for background artifacting
#fi

#to check which terminal you are using type:
#echo "$TERM"

#everything inside here will run whenever a tty window is opened
if [ "$TERM" = "linux" ]; then
    setterm -foreground green -store
fi

#references:
#https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
[ -s ~/.luaver/completions/luaver.bash ] && . ~/.luaver/completions/luaver.bash


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sebas5758/.sdkman"
[[ -s "/home/sebas5758/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sebas5758/.sdkman/bin/sdkman-init.sh"

#-------------------=== Kitty ===-------------------------------
# for kitty support
source <(kitty + complete setup bash)

#-------------------=== Starship ===-------------------------------
# for starship shell prompt support

_MY_STARSHIP="$(which starship)"
if [ -e "${_MY_STARSHIP}" ]; then

    eval "$(starship init bash)"

    function set_win_title() {
        win_tittle=${PWD/"$HOME"/"~"}
        echo -ne "\033]0; $win_tittle \007"
        # exanples:
            # $(basename $PWD)
            # $USER
            # $HOSTNAME
            # $PWD
            # normal_text
    }

    starship_precmd_user_func="set_win_title"
else
    # starship is not installed, but can be installed with:
    # `curl -fsSL https://starship.rs/install.sh | bash`
    :
fi
unset _MY_STARSHIP




