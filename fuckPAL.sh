#!/bin/sh

while [ true ]
do
    # if connected to PAL
    if [ "$(nmcli device | grep PAL3.0 | wc -l)" == "1" ]
    then
        #try to ping internet
        ping archlinux.org -c 1 > /dev/null
        #if you cant
        if [ $? -ne 0 ]
        then
            echo "CYCLING"
            #cycle the wifi router
            nmcli radio wifi off
            sleep 1
            nmcli radio wifi on
        fi
    fi
    sleep 30
done
