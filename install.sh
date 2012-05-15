#!/bin/sh

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
    echo "  mv $f ~/$g";
    if [ "$simulate" == 0 ]
    then
        mv $f ~/$g;
    fi
done
