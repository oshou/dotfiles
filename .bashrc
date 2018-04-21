# .bashrc

# Load global definition
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Prompt
HOSTTYPE="dev" # dev/stg/pri
case "$HOSTTYPE" in
  "dev") PROMPT_COLOR_NUM=32 ;;  # prompt_color -> green
  "stg") PROMPT_COLOR_NUM=33 ;;  # prompt_color -> yellow
  "prd") PROMPT_COLOR_NUM=31 ;;  # prompt_color -> red
  *)     PROMPT_COLOR_NUM=35 HOSTTYPE="unknown" ;;
esac

# Exports
export PS1='\[\033[1;${PROMPT_COLOR_NUM}m\][\u@(${HOSTTYPE})\H \t \W]$\[\033[00m\] '
export HISTSIZE=100000
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '

# For Ruby
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin:/opt/packer"

# For Python
export PYENV_PATH="$HOME/.pyenv"


# Aliases
alias v="vim"
alias h="history | tail"
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
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias dstat='dstat -tplcmsdrn'
alias dstat-cpu='dstat -tplcr'
alias dstat-mem='dstat -tplcms'
alias dstat-disk='dstat -tplcdr'
alias dstat-net='dstat -tpln --socket --tcp --udp --unix'
alias dcon='docker exec -it'

# Launch tmux
tmux
