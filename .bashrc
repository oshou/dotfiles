# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
tmux

# Exports
export EDITOR="/usr/local/bin/vim"
export PS1="\[\033[1;32m\][\u@\h \t \W]\[\033[00m\]"
export PATH=$PATH:$HOME/bin:/root/.rbenv/shims
# export APACHE_ROOT="/etc/httpd"
export NGINX_ROOT="/etc/nginx"
export DOC_ROOT="/var/www/html"
export SRC_ROOT="/usr/local/src"
export SRC_RUBY="/usr/local/src/ruby"
# export WEBAPPS_ROOT="/usr/local/tomcat/webapps"

# AWS Setting
complete -C aws_completer aws

# Setting Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Setting Node.js
if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

# Setting Java
# export JAVA_HOME=/usr/local/java
# export TOMCAT_ROOT=/usr/local/tomcat
# export PATH=$PATH:${JAVA_HOME}/bin

# Aliases
alias ~="cd ~"
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
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
alias nlog="vim /var/log/nginx/ "
alias ulog="vim /var/log/unicorn/"
alias j="jobs"
alias h="history | tail"
alias x="exit"
alias grep="grep --color=auto"
alias bashrc="v ~/.bashrc"
alias vimrc="v ~/.vimrc"
alias ngxconf="vim /etc/nginx"
alias reload="source ~/.bashrc && source ~/.vimrc"
alias be="bundle exec"
alias dstat='dstat -tlpcmsdrn'
alias dstat-mem='dstat -tlcmsp'
alias dstat-cpu='dstat -tlcrsp'
alias dstat-net='dstat -tlcndsp'
alias dstat-disk='dstat -tlcdrsp'
