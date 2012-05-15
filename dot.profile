#!/bin/sh  -*- shell-script -*-

if test "$TERM_PROGRAM" = 'Apple_Terminal' 
then
    export PAGER=aless	
    export EDITOR='open -a Emacs '
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs '

    function con () {
        open -a Console $@;
    }
#make cocoon happy
    export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home`

#try to make java happy
    export CLASSPATH=
    for JAR in ~/Classes/*.jar; do
        export CLASSPATH=$CLASSPATH:$JAR
    done

else
	export PAGER=less
	export EDITOR='/usr/bin/emacs -nw'	
	function emacs () {	
		/usr/bin/emacs -nw $@ 
	}
fi

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
export PATH=$PATH:/android-sdk-macosx/tools

# get some dyna-loader happyness
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pgsql/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/pgsql/lib

# #get the manpath set right
export MANPATH=$MANPATH:/usr/local/pgsql/man
export MANPATH=$MANPATH:/opt/local/share/man

#command line
export PS1="\[\e[0;33m\][\t][\u@\h \W]$\[\e[0m\] "

#turn on colour ls
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#HISTORY niceityies.
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoreboth
export HISTFILESIZE=20000
export HISTSIZE=20000
export SAVEHIST=40000
export HISTTIMEFORMAT='%F %T'
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

# make tar not suck.
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

# make vc not suck.
export SVN_EDITOR=/usr/bin/emacs
export GIT_EDITOR=/usr/bin/emacs
. ~/.git-completion

#nifty aliases
alias cpan='sudo env FTP_PASSIVE=1 perl -MCPAN -e "shell"'
alias env='env | sort'
alias j='jobs'
alias l='ls -lFh'
alias la='ls -alFh'
alias path='echo $PATH | perl -ple "s/:/\n/g"'
alias rmds='find . -name ".DS_Store" -print -exec rm \{} \;'
alias rmlc='find . -name ".localized" -print -exec rm \{} \;'
alias saxon-compile='java net.sf.saxon.Compile '
alias saxon='java -jar ~/Classes/saxon9he.jar '
alias semacs='sudo /Applications/Emacs.app/Contents/MacOS/Emacs -nw '
alias ncftp='EDITOR=/usr/bin/emacs ncftp '

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



