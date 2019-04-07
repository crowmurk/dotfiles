#!/bin/bash

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    echo Zsh running
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    echo Bash running
else
    echo Unknown shell...
fi
