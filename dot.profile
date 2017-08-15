#!/bin/bash  -*- shell-script -*-

# load the shell dotfiles and then a few extras.
for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

#  ------------------------------------- 
setjdk 1.8

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

#  ------------------------------------- 
# command completion with ssh host<TAB>
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ping
complete -c -f command sudo

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# If possible, add git tab competion for oodles of git things.
[ -f ~/.git-completion ] && source ~/.git-completion

#  ------------------------------------- 
uname=`uname | tr '[:upper:]' '[:lower:]'`;
if [ -e ~/.profile.${uname} ]
then
    . ~/.profile.${uname};
else
    echo "warning: no os specific profile for ${uname}";
fi

# get perlbrew going             

if [ -e /opt/perl/etc/bashrc ]
then
    export PERLBREW_ROOT=/opt/perl
    source /opt/perl/etc/bashrc
    source /opt/perl/etc/perlbrew-completion.bash
fi
