#!/bin/bash  -*- shell-script -*-

# load the shell dotfiles and then a few extras.
for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

#  -------------------------------------
setjdk 14

#  -------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#  -------------------------------------

# turn off ^S/^Q to suspend/resume the term
stty -ixon

# Help bash autocomplete filenames starting with dots
shopt -s dotglob

#HISTORY niceityies.
shopt -s histappend
shopt -s cmdhist

# tab completion to tollerate typos.
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

#  -------------------------------------
uname=`uname | tr '[:upper:]' '[:lower:]'`;
if [ -e ~/.profile.${uname} ]
then
    . ~/.profile.${uname};
else
    echo "warning: no os specific profile for ${uname}";
fi

if compgen -G "$HOME/.ssh/id_rsa*" > /dev/null; then
    agent_file=$HOME/.ssh/agent
    ssh-add -l &>/dev/null

    if [ "$?" == 2 ]; then
        test -r $agent_file && \
            eval "$(<$agent_file)" >/dev/null
        
        ssh-add -l &>/dev/null
        if [ "$?" == 2 ]; then
            (umask 066; ssh-agent > $agent_file)
            eval "$(<$agent_file)" >/dev/null
            ssh-add
        fi
    fi
fi

