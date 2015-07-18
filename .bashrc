# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment and startup programs
tmux
complete -C aws_completer aws
export EDITOR="/usr/local/bin/vim"
export AWS_CONFIG_FILE=/root/.aws/aws.config
export RBENV_ROOT="/usr/local/rbenv"
export PATH=$PATH:$HOME/bin:/usr/local/heroku/bin:${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:/usr/libexec/git-core/
eval "$(rbenv init -)"

# Alias - base
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias df="df -h"
alias ls="ls -CF"
alias ll="ls -la"
alias lsg="ls -la | grep"
alias p="ps aux | less"
alias psg="ps aux | grep"
alias v="vim"
alias j="jobs"
alias h="history | tail"
alias x="exit"

alias dstat='dstat -tlcmdrnsp'
alias dstat-mem='dstat -tlcmsp'
alias dstat-cpu='dstat -tlcrsp'
alias dstat-net='dstat -tlcndsp'
alias dstat-disk='dstat -tlcdrsp'

# Alias - Rails
alias be="bundle exec"
alias rc="rails console"
alias rcs="rails console --sandbox"
alias rs="rails s -b 0.0.0.0"
