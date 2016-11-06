# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
tmux

# Exports
export EDITOR="/usr/local/bin/vim"
export PS1="\[\033[1;32m\][\u@\h \t \W]\[\033[00m\]"
export PATH=$PATH:$HOME/bin

# Aliases
alias ~="cd ~"
alias .="cd .."
alias ..="cd ../.."
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
alias v="vim"
alias j="jobs"
alias h="history | tail"
alias x="exit"
alias log="vim /var/log/"
alias grep="grep --color=auto"
alias bashrc="v ~/.bashrc"
alias vimrc="v ~/.vimrc"
alias dstat-full='dstat -tlcmsdrn'
alias dstat-cpu='dstat -tlcr'
alias dstat-mem='dstat -tlcms'
alias dstat-disk='dstat -tlcdr'
alias dstat-net='dstat -tln --socket --tcp --udp --unix'
