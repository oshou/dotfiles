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
export PATH="$PATH:/usr/local/opt/mysql-client/bin"
export PATH="$PATH:./vendor/bin"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# AnyEnv
eval "$(anyenv init -)"
# for Go
eval "$(goenv init -)"
# for Python
eval "$(pyenv init -)"
# for PHP
eval "$(phpenv init -)"

# Aliases
# - Common
alias v="vim"
alias h="history | less"
alias grep="grep --color=auto"
alias less="less -N"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df="df -Th"
alias ll="ls -la"
alias llg="ll | grep"
alias llp="ll | peco"
alias ps="ps"
alias psg="ps | grep"
alias psp="ps | peco"
alias ntsg="netstat | grep"
alias ntsp="netstat | peco"
alias envg="env | grep"
alias envp="env | peco"
alias bashrc="vim ~/.bashrc"
alias bashreload="source ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias dstat='dstat -tplcmsdrn'
alias gip='echo `curl -s ifconfig.me`'
# - Git
alias ga="git add -A"
alias gc="git commit -m "
alias gam="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpull="git pull"
alias gpush="git push origin master"
# - Golang
alias gorun='go run main.go'
# alias gsrc='go doc -src $1 | peco'
alias gci='golangci-lint run'
# - PHP
alias phpbs='php -S localhost:8000'
alias phpunit='phpunit --colors'
# - docker
alias dcon='docker exec -it'
alias dlog='docker logs'
alias dkill='docker kill'
alias ddown='docker ps -aq | xargs docker stop | xargs docker rm'
alias dimgkillall='docker rmi `docker images -q`'
# - docker-compose
alias dcps='docker-compose ps'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dckill='docker-compose kill'
alias dcrm='docker-compose rm -f'
# - kubectl
alias kapply='kubectl apply'
alias kdelete='kubectl delete'
alias kget='kubectl get'
alias kdesc='kubectl describe'
alias kcon='kubectl exec -it'
alias kall='kubectl get all -o wide'
alias kconfig='kubectl config view'
alias kctx='kubectl config get-contexts'
alias kcls='kubectl config get-clusters'
alias kns='kubectl get namespaces'
alias knodes='kubectl get nodes -o wide'
alias kpods='kubectl get pods -o wide'
alias kdep='kubectl get deployments -o wide'
alias krs='kubectl get replicasets -o wide'
alias kss='kubectl get statefulsets -o wide'
alias kds='kubectl get daemonsets -o wide'
alias kpvc='kubectl get persistentvolumeclaims -o wide'
alias kpv='kubectl get persistentvolumes -o wide'
alias ksvc='kubectl get services -o wide'
alias ksec='kubectl get secrets -o wide'
alias kcm='kubectl get configmap -o wide'
alias kjobs='kubectl get jobs -o wide'

# Launch tmux
tmux

# Functions
function ghql() {
  local selected_file=$(ghq list --full-path | peco)
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
    fi
  fi
}
bind -x '"\201": ghql'
bind '"\C-g":"\201\C-m"'

function gsrc() {
  local query=$(go doc -src $1 | peco | awk -F'[ (]' '{print $2}')
  if [ -n "$query" ]; then
    if [ -t 1 ]; then
      go doc -src $1.${query}
    fi
  fi
}

function gpkg() {
  local package=$(go list std | peco)
  if [ -n "$package" ]; then
    if [ -t 1 ]; then
      go doc -src ${package}
    fi
  fi
}
