# ~/.bashrc: executed by bash(1) for non-login shells.

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# FOO="${FOO:-value}"
# When FOO is already defined the construct ${FOO:-value} expands to its
# current value. When FOO is undefined, it expands to 'value', so this
# way you can keep environment settings from any parent process of the
# shell, but override them with your own defaults if they are unset.

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE="${HISTSIZE:-20000}"
# HISTSIZE=20000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export CLICOLOR=1

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/bin/git-prompt.sh ]; then
    . ~/bin/git-prompt.sh
fi

if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

export EDITOR='vim'

PROMPT_COMMAND='export ERR=$?'

case $TERM in
    xterm*)
        TITLEBAR='\[\e]0;\h \w\007\]';
        ;;
    *)
        TITLEBAR="";

        ;;
esac

PS1="$TITLEBAR\n/--${BRIGHT_WHITE}[${RESET} \w ${GREEN}\$(__git_ps1 %s) ${BRIGHT_WHITE}]${RESET}\n\--> ${WHITE}\u${RESET}@${BRIGHT_YELLOW}\h${RESET} \$ "
