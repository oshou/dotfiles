# .bashrc

#alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll="ls -la"
alias j="jobs"
alias h="history | tail"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
