#!/bin/bash

# shellcheck source=dot.exports
source "$HOME/.exports"

# shellcheck source=dot.aliases
source "$HOME/.aliases"

# shellcheck source=dot.functions
source "$HOME/.functions"

#  -------------------------------------
setjdk 15

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

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

#  -------------------------------------
uname=$(uname | tr '[:upper:]' '[:lower:]')
if [ -e "$HOME/.profile.${uname}" ]
then
    # shellcheck disable=SC1090
    source "$HOME/.profile.${uname}";
else
    echo "warning: no os specific profile for ${uname}";
fi

if compgen -G "$HOME/.ssh/id_rsa*" > /dev/null; then
    agent_file=$HOME/.ssh/agent
    ssh-add -l &>/dev/null

    if [ "$?" == 2 ]; then
        test -r "$agent_file" && \
            eval "$(<"$agent_file")" >/dev/null
        
        ssh-add -l &>/dev/null
        if [ "$?" == 2 ]; then
            (umask 066; ssh-agent > "$agent_file")
            eval "$(<"$agent_file")" >/dev/null
            ssh-add
        fi
    fi
fi

gpgconf --launch gpg-agent
