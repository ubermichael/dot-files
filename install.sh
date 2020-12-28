#!/bin/bash

cmd=`basename $0`;
hostname=$1;
simulate=0;

while getopts "n" options; do
    case $options in
        n) simulate=1 ;;
        *) echo "usage: $cmd [-n]"; exit 1 ;;
    esac
done

for f in dot.*; do
    g="$HOME/${f/dot/}"
    echo "ln $f $g"
    if [[ "$simulate" == 1 ]]; then
        continue
    fi
    
    rm -f "$g"
    ln "$f" "$g"    
done
