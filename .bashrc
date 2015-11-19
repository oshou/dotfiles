# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
tmux

# Exports
export EDITOR="/usr/local/bin/vim"
export AWS_CONFIG_FILE=/root/.aws/aws.config
export PATH=$PATH:$HOME/bin:/usr/local/heroku/bin:/usr/libexec/git-core/
export APACHE_ROOT="/etc/httpd"
export DOC_ROOT="/var/www/html"
export SRC_ROOT="/usr/local/src"
export WEBAPPS_ROOT="/usr/local/tomcat/webapps"

# AWS Setting
complete -C aws_completer aws

# Setting Rails
export RBENV_ROOT="/usr/local/rbenv"
export PATH=$PATH:${RBENV_ROOT}/bin:${RBENV_ROOT}/shims
alias be="bundle exec"
alias rc="rails console"
alias rcs="rails console --sandbox"
alias rs="rails s -b 0.0.0.0"
eval "$(rbenv init -)"

# Setting Node.js
if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

# Setting Java
export JAVA_HOME=/usr/local/java
export TOMCAT_ROOT=/usr/local/tomcat
export PATH=$PATH:${JAVA_HOME}/bin

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
alias nts="netstat -pantu"
alias v="vim"
alias alog="cd $APACHE_ROOT/logs/ && vim"
alias tlog="cd $TOMCAT_ROOT/logs/ && vim"
alias j="jobs"
alias h="history | tail"
alias x="exit"
alias grep="grep --color=auto"
alias bashrc="v ~/.bashrc"
alias vimrc="v ~/.vimrc"
alias reload="source ~/.bashrc && source ~/.vimrc"
alias dstat='dstat -tlpcmsdrn'
alias dstat-mem='dstat -tlcmsp'
alias dstat-cpu='dstat -tlcrsp'
alias dstat-net='dstat -tlcndsp'
alias dstat-disk='dstat -tlcdrsp'
