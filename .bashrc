# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Exports
HOSTTYPE="dev"
case "$HOSTTYPE" in
  "dev") PROMPT_COLOR_NUM=32 ;;  # PromptColor -> green
  "stg") PROMPT_COLOR_NUM=33 ;;  # PromptColor -> yellow
  "prd") PROMPT_COLOR_NUM=31 ;;  # PromptColor -> red
  *)     PROMPT_COLOR_NUM=35 HOSTTYPE="unknown" ;;
esac
export PS1='\[\033[1;${PROMPT_COLOR_NUM}m\][\u@(${HOSTTYPE})\h \t \W]$\[\033[00m\] '
export HISTSIZE=100000
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
alias less="less -N"
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
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias dstat='dstat -tplcmsdrn'
alias dstat-cpu='dstat -tplcr'
alias dstat-mem='dstat -tplcms'
alias dstat-disk='dstat -tplcdr'
alias dstat-net='dstat -tpln --socket --tcp --udp --unix'
