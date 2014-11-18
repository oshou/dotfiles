# .bashrc

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll="ls -la"
alias h="history | tail"
alias j="jobs"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
