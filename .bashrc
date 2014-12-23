# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment and startup programs
tmux
complete -C aws_completer aws
export AWS_CONFIG_FILE=/root/.aws/aws.config
export RBENV_ROOT="/usr/local/rbenv"
export PATH=$PATH:$HOME/bin:/usr/local/heroku/bin:${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:/usr/libexec/git-core/
eval "$(rbenv init -)"

# Alias
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias df="df -h"
alias ls="ls -CF"
alias ll="ls -la"
alias j="jobs"
alias x="exit"
alias v="vim"
alias h="history | tail"
alias be="bundle exec"
alias rc="rails console"
alias rcs="rails console --sandbox"
alias dstat='dstat -tlcmdrn'
alias dstat-mem='dstat -tlcm'
alias dstat-cpu='dstat -tlcr'
alias dstat-net='dstat -tlcnd'
alias dstat-disk='dstat -tlcdr'
