#!/usr/bin/bash

if [ $# -eq 0 ]; then
    fzf --bind "enter:execute(nvim {})+abort";
elif [ $# -eq 1 ]; then
    fzf --query=$1 --bind "enter:execute(nvim {})+abort";
elif [ $# -gt 1 ]; then
    echo "Only pass 1 argument to se for now";
fi
