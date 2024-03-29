# Patch
alias rdocker="killall Docker && cd /Applications;open -a Docker;cd ~"

# Prompt
eval "$(starship init zsh)"

# Exports
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '
export HISTSIZE=100000
export EDITOR=vim
export GOROOT="$HOME/.asdf/installs/golang/1.18.10/go"
export GOPATH="$GOROOT/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:./vendor/bin"
export PATH="$PATH:/usr/local/opt/bison@2.7/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"
export GOOGLE_ACCOUNT_MAIL=dev.oshou04@gmail.com
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/legacy_credentials/$GOOGLE_ACCOUNT_MAIL/adc.json

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
alias brewfile="vim ~/brewfile"
alias vimrc="vim ~/.vimrc"
alias dstat='dstat -tplcmsdrn'
alias gip='echo `curl -s ifconfig.me`'
# - git
alias ga="git add -A"
alias gc="git commit -m "
alias gamend="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gbranch="git branch"
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
alias dcup='docker-compose up -d'
alias dclogs='docker-compose logs'
alias dcdown='docker-compose down'
alias dckill='docker-compose kill'
alias dcrm='docker-compose rm -f'
# - kubectl
alias kapply='kubectl apply'
alias kdelete='kubectl delete'
alias klogs='kubectl logs'
alias kget='kubectl get'
alias kdesc='kubectl describe'
alias kcon='kubectl exec -it'
alias kall='kubectl get nodes,sa,ing,svc,deploy,rs,sts,ds,jobs,po,cm,secrets,pvc,pv -o wide'
alias kconf='kubectl config view'
alias kctx='kubectx'
alias kcls='kubectl config get-clusters'
alias kns='kubens'
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
alias portchk='(){lsof -i4TCP:$1}'
alias portkill=$'(){lsof -i4TCP:$1 | awk \'NR>1{print "kill -9", $2}\' | bash }'
# - GCP
alias gclogin='gcloud auth login'
alias gcauth='gcloud auth list'
alias gcconf='gcloud config configurations list'
alias gcpj='gcloud projects list'
alias gcsvc='gcloud services list'
alias gcsa='gcloud iam service-accounts list'

# Launch tmux
#tmux

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
