#!/bin/bash

#for every folder in the directory
for D in *; do
    if [ -d "${D}" ]; then
        #enter the folder
        cd "${D}"
        #for every file in the directory with .avi
        for F in *.avi; do
            #if the mp4 does already exist
            if [ -f "${F%%.avi}.mp4" ]; then
                #delete the avi
                rm "${F}"
                echo deleted ${F}
            fi
            #clear
            #echo "done with file"
        done
        #exit the folder
        cd ..
    fi
done
#for evey file in the parent directory
for F in *.avi; do
    #if the mp4 does already exist
    if [ -f "${F%%.avi}.mp4" ]; then
        #delete the avi
        rm "${F}"
        echo deleted ${F}
    fi
    #clear
    #echo "done with file"
done
#print done
echo "done"
