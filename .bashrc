# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
tmux

# Exports
export PS1="\[\033[1;32m\][\u@\h \t \W]\[\033[00m\]"
export HISTSIZE=10000
export HISTTIMEFORMAT='%Y-%m-%dT%T%z '
export EDITOR="/usr/local/bin/vim"

# Aliases
alias ~="cd ~"
alias .="cd .."
alias ..="cd ../.."
alias v="vim"
alias h="history | tail"
alias j="jobs"
alias grep="grep --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias df="df -h"
alias ls="ls -CF --color=auto"
alias ll="ls -la"
alias llg="ls -la | grep"
alias pa="ps aux | less"
alias pag="ps aux | grep"
alias envg="env | grep"
alias nts="netstat -pantu"
alias x="exit"
alias bashrc="vi ~/.bashrc"
alias vimrc="vi ~/.vimrc"
alias dstat-full='dstat -tlcmsdrn'
alias dstat-cpu='dstat -tlcr'
alias dstat-mem='dstat -tlcms'
alias dstat-disk='dstat -tlcdr'
alias dstat-net='dstat -tln --socket --tcp --udp --unix'
