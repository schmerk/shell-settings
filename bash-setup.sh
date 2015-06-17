# bash-setup.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

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

# Stop trying to send up a password window if there is no display
if [ -z $DISPLAY ]; then
    unset SSH_ASKPASS
fi

# Source alias definitions
if [ -f ~/.scripts/alias.sh ]; then
    source ~/.scripts/alias.sh
fi

# Source prompt settings/behavior
if [ -f ~/.scripts/prompt.sh ]; then
    source ~/.scripts/prompt.sh
fi

