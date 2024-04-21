# Patch
alias rdocker="killall Docker && cd /Applications;open -a Docker;cd ~"

# Prompt
eval "$(starship init zsh)"

# Exports
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '
export HISTSIZE=100000
export EDITOR=vim
# export GOROOT="$HOME/.asdf/installs/golang/1.18.10/go"
export GOROOT="$(asdf where golang)/go"
export GOPATH="$GOROOT/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:./vendor/bin"
export PATH="$PATH:/usr/local/opt/bison@2.7/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# direnv
eval "$(direnv hook zsh)"
# gh
eval "$(gh completion -s zsh)"


# Aliases
# - common
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
alias lsoft="lsof -nP -iTCP"
alias lsoftg="lsof -nP -iTCP | grep"
alias psg="ps | grep"
alias psp="ps | peco"
alias ntsg="netstat | grep"
alias ntsp="netstat | peco"
alias envg="env | grep"
alias envp="env | peco"
alias zshrc="vim ~/.zshrc"
alias zprofile="vim ~/.zprofile"
alias zreload="source ~/.zshrc"
alias envreload="export $(grep -v '^\s*#' .env | xargs)"
alias brewfile="vim ~/brewfile"
alias vimrc="vim ~/.vimrc"
alias dstat='dstat -tplcmsdrn'
alias gip='echo `curl -s ifconfig.me`'
alias portchk='(){lsof -i4TCP:$1}'
alias portkill=$'(){lsof -i4TCP:$1 | awk \'NR>1{print "kill -9", $2}\' | bash }'
# - git
alias gol="git log --oneline"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add -A"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gamend="git commit --amend"
alias gpull="git pull"
alias gpush="git push origin master"
# - terraform
alias tf="terraform"
# - golang
alias gorun='go run main.go'
alias gci='golangci-lint run'
# - php
alias phpbs='php -S localhost:8000'
alias phpunit='phpunit --colors'
# - node
alias tsnd='ts-node-dev'
# - docker
alias dcon='docker exec -it'
alias dlog='docker logs'
alias dkill='docker kill'
alias ddown='docker ps -aq | xargs docker stop | xargs docker rm'
alias dimgkillall='docker rmi `docker images -q`'
# - docker-compose
alias dcps='docker-compose ps'
alias dclogs='docker-compose logs --tail=50 -f'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dckill='docker-compose kill'
alias dcrm='docker-compose rm -f'
# - k8s
alias kconfig='kubectl config view'
alias kctx='kubectx'
alias klogs='kubectl logs'
alias kget='kubectl get'
alias kdesc='kubectl describe'
alias kall='kubectl get nodes,sa,ing,svc,deploy,rs,sts,ds,jobs,po,cm,secrets,pvc,pv -o wide'
alias kcls='kubectl config get-clusters'
alias kns='kubens'
alias kcon='kubectl exec -it'
alias kapply='kubectl apply'
alias kdelete='kubectl delete'
# - GCP
alias gclogin='gcloud auth login'
alias gcauth='gcloud auth list'
alias gcconf='gcloud config configurations list'
alias gcpj='gcloud projects list'
alias gcsvc='gcloud services list'
alias gcsa='gcloud iam service-accounts list'

# -RT
alias ytj='yarn test:jest'
alias ytjp='yarn test:jest-parallel'

# Launch tmux
# tmux

# ghq list
function ghql() {
  local selected_file=$(ghq list --full-path | peco)
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
    fi
  fi
}

# go doc -src
function gsrc() {
  local query=$(go doc -src $1 | peco | awk -F'[ (]' '{print $2}')
  if [ -n "$query" ]; then
    if [ -t 1 ]; then
      go doc -src $1.${query}
    fi
  fi
}

# go doc
function gpkg() {
  local package=$(go list std | peco)
  if [ -n "$package" ]; then
    if [ -t 1 ]; then
      go doc -src ${package}
    fi
  fi
}

# switch k8s-context
function ksw() {
	kcontext=$(kubectl config get-contexts  | peco --initial-index=1 --prompt='kubectl config use-context > ' |  sed -e 's/^\*//' | awk '{print $1}')
  if [ -n "$kcontext" ]; then
  	echo "[ksw] switch to ${kcontext}."
  	kubectl config use-context $kcontext
  fi
}

# switch gcloud-project
function gsw() {
	project=$(gcloud projects list   | peco --initial-index=1 --prompt='gcloud config set project > ' |  sed -e 's/^\*//' | awk '{print $1}')
  if [ -n "$project" ]; then
  	echo "[gsw] switch to ${project}."
    gcloud config set project $project
  fi
}

function bkup() {
  cp -rp $1 $1_`date "+%Y%m%d-%H%M%S"`
}

function gzip() {
  zip $1.zip $1
}
