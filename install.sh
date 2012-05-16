#!/bin/bash

cmd=`basename $0`;
simulate=0;

while getopts "n" options; do
    case $options in
        n) echo "$cmd simulating."; simulate=1 ;;
        *) echo "usage: $cmd [-n]"; exit 1 ;;
    esac
done

for f in dot.*; do
    g=`echo $f | sed -e 's/^dot//'`;
    echo "  cp $f ~/$g";
    if [ "$simulate" == 0 ]
    then
        cp $f ~/$g;
    fi
done

uname=`uname | tr '[:upper:]' '[:lower:]'`;
if [ -e defaults.${uname}.sh ]
then
    echo "  defaults.${uname}.sh";
    if [ "$simulate" == 0 ]
    then
        . defaults.${uname}.sh;
    fi
else
    echo "warning: no os specific defaults for ${uname}";
fi
