source ~/.profile
# .bash_profile

# Patch
alias rdocker="killall Docker && cd /Applications;open -a Docker;cd ~"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Prompt
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
if [ $UID -eq 0 ]; then
    PS1='\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
else
    PS1='\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
fi

# Exports
export HISTTIMEFORMAT='[%Y-%m-%d %T%z] '
export HISTSIZE=100000
export PATH="$PATH:$HOME/.anyenv/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:./vendor/bin"
export PATH="$PATH:/usr/local/opt/mysql-client/bin"
export PATH="$PATH:/usr/local/opt/bison@2.7/bin"
# export PATH="$PATH:$HOME/.anyenv/envs/pyenv/bin"
export GOOGLE_ACCOUNT_MAIL=dev.oshou04@gmail.com
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/legacy_credentials/$GOOGLE_ACCOUNT_MAIL/adc.json

# gh
eval "$(gh completion -s bash)"
# AnyEnv
eval "$(anyenv init -)"
# direnv
eval "$(direnv hook bash)"
# for Go
eval "$(goenv init -)"
# for Python
eval "$(pyenv init -)"
# for PHP
eval "$(phpenv init -)"
# for Node
export PATH=$PATH:./node_modules/.bin

# Direnv
eval "$(direnv hook bash)"


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
alias lsoft="lsof -nP -iTCP"
alias lsoftg="lsof -nP -iTCP | grep"
alias psg="ps | grep"
alias psp="ps | peco"
alias ntsg="netstat | grep"
alias ntsp="netstat | peco"
alias envg="env | grep"
alias envp="env | peco"
alias bashrc="vim ~/.bashrc"
alias bashprofile="vim ~/.bash_profile"
alias bashreload="source ~/.bash_profile"
alias brewfile="vim ~/brewfile"
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
# - Node
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

complete -C /usr/local/Cellar/tfenv/1.0.2/versions/0.12.24/terraform terraform
