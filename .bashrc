# .bashrc

# Load global definition
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi
