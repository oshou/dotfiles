# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll="ls -la"
alias j="jobs"
alias h="history | tail"
alias dstat='dstat -tlcmdrn'
alias dstat-mem='dstat -tlcm'
alias dstat-cpu='dstat -tlcr'
alias dstat-net='dstat -tlcnd'
alias dstat-disk='dstat -tlcdr'

export PS1='[\u@\h \W]# '
export PATH=$PATH:/usr/local/rbenv/shims
