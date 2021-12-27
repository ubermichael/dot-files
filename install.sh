#!/bin/bash

cmd=$(basename "$0");
simulate=0;

while getopts "n" options; do
    case $options in
        n) simulate=1 ;;
        *) echo "usage: $cmd [-n]"; exit 1 ;;
    esac
done

mkdir -p "$HOME/bin"
for f in bin/*; do
  g="$HOME"/bin/$(basename $f);
  echo "ln $f $g"
  if [[ "$simulate" == 1 ]]; then
    continue
  fi
  rm -f "$g"
  ln "$f" "$g"
done

files=$(shopt -s nullglob dotglob; echo LaunchAgents/*)
if (( ${#files} )); then
  mkdir -p "$HOME/Library/LaunchAgents"
  for f in LaunchAgents/*; do
    g="$HOME"/Library/LaunchAgents/$(basename $f);
    echo "ln $f $g"
    if [[ "$simulate" == 1 ]]; then
      continue
    fi
    rm -f "$g"
    ln "$f" "$g"
  done
fi

for f in dot.*; do
    g="$HOME/${f/dot/}"
    echo "ln $f $g"
    if [[ "$simulate" == 1 ]]; then
        continue
    fi

    rm -f "$g"
    ln "$f" "$g"
done
