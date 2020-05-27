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
source /usr/local/share/kube-ps1.sh
export PS1='[\u@\h \W $(kube_ps1)]\$ '
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '
export HISTSIZE=100000
export PATH="$PATH:/usr/local/opt/mysql-client/bin"
export PATH="$PATH:./vendor/bin"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/legacy_credentials/$GOOGLE_ACCOUNT_MAIL/adc.json

# AnyEnv
eval "$(anyenv init -)"
# for Go
eval "$(goenv init -)"
# for Python
eval "$(pyenv init -)"

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
alias gamend="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gbranch="git branch"
alias gpull="git pull"
alias gpush="git push origin master"
# - Terrafrom
alias tf="terraform"
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
# - GCP
alias gclogin='gcloud auth login'
alias gcauth='gcloud auth list'
alias gcconf='gcloud config configurations list'
alias gcpj='gcloud projects list'
alias gcsvc='gcloud services list'
alias gcsa='gcloud iam service-accounts list'
# - Terraform
alias tf='terraform'

# Launch tmux
tmux

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
bind -x '"\201": ghql'
bind '"\C-g":"\201\C-m"'

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
  	kubectl config use-context $kcontext
  fi
}

# switch gcloud-project
function gsw() {
	project=$(gcloud projects list   | peco --initial-index=1 --prompt='gcloud config set project > ' |  sed -e 's/^\*//' | awk '{print $1}')
  if [ -n "$project" ]; then
  	echo "Switch to ${project}."
    gcloud config set project $project
  fi
}

complete -C /usr/local/Cellar/tfenv/1.0.2/versions/0.12.24/terraform terraform
