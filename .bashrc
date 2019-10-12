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
export PS1='\[\033[1;${PROMPT_COLOR_NUM}m\][\u@(${HOSTTYPE})\h \t \W]$\[\033[00m\] '
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '
export HISTSIZE=100000
export PATH="$PATH:/usr/share/vim/vim81"
export PATH="$PATH:/usr/local/opt/mysql-client/bin"

# AnyEnv
eval "$(anyenv init -)"
# for Ruby
eval "$(rbenv init -)"
# for Python
eval "$(pyenv init -)"
# for PHP
eval "$(phpenv init -)"
# for Go
eval "$(goenv init -)"

# Aliases
alias v="vim"
alias h="history | less"
alias grep="grep --color=auto"
alias less="less -N"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df="df -Th"
alias ll="ls -la"
alias llg="ls -la | grep"
alias ps="ps aux"
alias psg="ps aux | grep"
alias nts="netstat -pantu"
alias ntsg="netstat -pantu | grep"
alias envg="env | grep"
alias dstat='dstat -tplcmsdrn'
alias dcon='docker exec -it'
alias dlog='docker logs'
alias dkillall='docker ps -aq | xargs docker stop | xargs docker rm'
alias dimgkillall='docker rmi `docker images -q`'
alias dcps='docker-compose ps'
alias dcup='docker-compose up -d'
alias dckill='docker-compose kill'
alias dcrm='docker-compose rm -f'
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"

# Launch tmux
tmux
