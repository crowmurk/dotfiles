#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt string
PS1='[\u@\h \W]\$ '

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups:ignoreboth
export HISTIGNORE="history*:exit*"
shopt -s histappend
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

# Set vi editing mode
set -o vi

# Common for all shells
source "${HOME}/.shellrc"
