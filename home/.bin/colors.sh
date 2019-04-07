#!/usr/bin/env bash

for i in {0..255} ; do
    if (( "${i}" > 0 )) && (( "${i}" % 16 == 0 )) ; then
        printf "\\n";
    fi
    printf "\\x1b[38;5;${i}m%3d\\e[0m " ${i};
done
printf "\\n";
