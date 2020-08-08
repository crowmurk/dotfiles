#!/bin/bash

PAUSE="1s"

killall nm-applet
sleep "${PAUSE}"

for i in 'radio wifi off' 'networking off' 'networking on' 'radio wifi on' 'connection up router'
do
    notify-send -t 3000 "NetworkManager" "${i}..." --icon=applications-internet
    eval "nmcli ${i}"
    sleep "${PAUSE}"
done

nm-applet >/dev/null
notify-send -t 3000 "NetworkManager" "Wi-Fi restarted..." --icon=applications-internet
