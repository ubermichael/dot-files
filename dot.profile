#!/bin/bash  -*- shell-script -*-

# turn of ^S/^Q to suspend/resume the term
stty -ixon

# #get that damn path thingy set up nicely.
export PATH=/usr/local/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/pgsql/bin
export PATH=$PATH:/Users/michael/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin

#command line
export PS1="\[\e[0;33m\][\t][\u@\h \W]$\[\e[0m\] "

#turn on colour ls
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#HISTORY niceityies.
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoreboth
export HISTFILESIZE=200000
export HISTSIZE=200000
export SAVEHIST=400000
export HISTIGNORE='ls:bg:fg:history:ps'
export PROMPT_COMMEND='history -a; history -n'

# tab completion to tollerate typos.
shopt -s cdspell

#things to make perl happy
export LC_ALL=C
export LANG="en_CA"

# make bash tab compeletion not suck.
export FIGNORE=CVS
export FIGNORE=$FIGNORE:\~
export FIGNORE=$FIGNORE:.o
export FIGNORE=$FIGNORE:.svn 

# make vc not suck.
export SVN_EDITOR=emacs
export GIT_EDITOR=emacs
. ~/.git-completion

#nifty aliases
alias cpan='sudo env FTP_PASSIVE=1 perl -MCPAN -e "shell"'
alias env='env | sort'
alias j='jobs'
alias l='ls -lFh'
alias la='ls -alFh'
alias path='echo $PATH | perl -ple "s/:/\n/g"'
alias mysql='mysql --safe-updates'

#  ------------------------------------- 
# trying out command completion with ssh host<TAB>
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ping
complete -c -f command sudo

function critic() {
    perlcritic -4 . | perl -ple 's/^([^:]*): (.*? at line (\d+), column (\d+))/$1:$3:$4: $2/' > critic.log
}

function svn-revs () {
    for filename in $@; do
        for rev in `svn log $filename | grep  -E '^r[0-9]+' | sed -e 's/ | .*//'`; do
            echo  ${filename}.${rev}
            svn cat -${rev} ${filename} > ${filename}.${rev}
        done
    done
}

function svn-add() {
    svn st | grep '?' | sed -e 's/^?//' | xargs svn add
}

function svn-add() {
    svn st | grep '!' | sed -e 's/^!//' | xargs svn add
}

function svn-tag() {
  tag="$1";
  ver=`svnversion`;
  root=`svn info | grep 'Repository Root: ' | sed -e 's/Repository Root: //'`;
  svn cp $root/trunk $root/tags/$tag-r$ver -m "tagging $tag-$ver";
}

EXIST_URI=xmldb:exist://localhost:8080/exist/xmlrpc

function exist-client () {
    URI=$EXIST_URI
    USER=admin
    CLI=/Applications/eXist/bin/client.sh 
    
    JAVA_OPTIONS=-Xmx256M $CLI -ouri=$URI -u admin -s
}
function exist-app () {
    URI=$EXIST_URI
    USER=admin
    CLI=/Applications/eXist/bin/client.sh 
    
    JAVA_OPTIONS=-Xmx256MM $CLI -ouri=$URI -u admin
}
function exist-backup () {
    URI=$EXIST_URI
    DIR=~michael/cocoon/exist-backup
    USER=admin
    CLI=/Applications/eXist/bin/backup.sh 

    mkdir -p $DIR
    JAVA_OPTIONS=-Xmx256M $CLI -d $DIR -u $USER -ouri=$URI -b /db
}

# grepperies. Must come after all uses of grep because Darwin
# grep doesn't do --exclude-dir. 
GREP_OPTIONS="--color -P -i -n -H"
for p in .cvs '.git*' .hg .svn; do
    GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=$p"
done
export GREP_OPTIONS

uname=`uname | tr '[:upper:]' '[:lower:]'`;
if [ -e ~/.profile.${uname} ]
then
    . ~/.profile.${uname};
else
    echo "warning: no os specific profile for ${uname}";
fi
