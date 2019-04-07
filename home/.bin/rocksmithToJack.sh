#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo Invalid arguments
    exit 1
fi

logfile=/tmp/$(basename $0 | cut -f1 -d'.').log
connected="`ls /dev/input/by-id/usb-Hercules_Rocksmith_USB_Guitar_Adapter* 2>/dev/null | wc -l`"

{
    echo "Starting Jack..."
    cadence-session-start --system-start

    if [[ "$connected" -ne "0" ]]; then
        echo "Connect Ubisoft cable..."
        alsa_in -j "UbisoftMic" -d hw:Adapter,0 -q 1 -c 1 &
        echo "Starting $1..."
        $1
        echo "Disconnect Ubisoft cable..."
        kill $!
    else
        echo "Starting $1..."
        $1
    fi

    echo "Stoping Jack..."
    jack_control stop

} > $logfile 2>&1

exit 0
