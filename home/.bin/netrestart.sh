#!/bin/bash

for i in 'networking off' 'networking on' 'connection up router'
do
    notify-send -t 3000 "NetworkManager" "${i}..." --icon=applications-internet
    eval "nmcli ${i}"
    sleep 1
done
