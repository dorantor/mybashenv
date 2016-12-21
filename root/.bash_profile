# First of all, run a .bashrc file if it exists.
test -f ~/.bashrc && . ~/.bashrc

# init autocompletion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

