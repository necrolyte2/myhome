#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt string
source $HOME/git_info.bash
PS1='[\u@\h \W]\$(git_info)\$ '

##### ALIASES #####
# ls colors ON
alias ls='ls --color=auto'
# Use vim
alias vi='vim'
# Ensure python2.7
alias python='/usr/bin/python2.7'

##### Essential Environment Variables #####
# Default Terminal
TERM="rxvt-unicode-256color"
# Default Editor
EDITOR="vim"
# Directory Colors
# man dir_colors for more information on this
LS_COLORS='rs=0:di=1;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'
export LS_COLORS
