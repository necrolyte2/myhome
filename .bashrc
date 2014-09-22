#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e /etc/bash_completion.d/git-prompt ]
then
    PS1='[\u@\h \W]$(__git_ps1)\$ '
elif [ -e /etc/bash_completion.d/git ]
then
    . /etc/bash_completion.d/git
    GIT_PS1_SHOWDIRTYSTATE=1
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

##### ALIASES #####
# ls colors ON
alias ls='ls --color=auto'
# Use vim
alias vi='vim'
# Short git stuff
alias gs='git status'
alias gap='git add -p'
alias gcam='git commit -am'
# Latest dir listing
alias latestl='ls -ltr | tail -n'
alias latest='ls -tr | tail -n'
# Install python package
alias pyinstall='rm -rf build 2>/dev/null; python setup.py install'
# Because why not?
alias ssh='ssh -Y'
# Ensure nosetests is correctly called
alias nosetests='python $(which nosetests)'

##### Essential Environment Variables #####
export TERM=xterm-256color
alias latest='ls -ltr | tail -n'
# xclip shortcut for wgetting contents
alias xclip-wget='wget $(xclip -o)'
# Default Editor
EDITOR="vim"

# Allow for more customization for each machine
if [ -e ~/.bashrc.d ]
then
    for f in ~/.bashrc.d/*
    do
        . ${f}
    done
fi

# Directory Colors
# man dir_colors for more information on this
LS_COLORS='rs=0:di=1;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'
export LS_COLORS

export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export LD_LIBRARY_PATH=/home/AMED/tyghe.vallard/lib:/usr/lib64/openmpi/lib
export PATH=/home/AMED/tyghe.vallard/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib64/openmpi/bin
