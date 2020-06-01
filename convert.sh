#!/bin/bash

#for every folder in the directory
for D in *; do
    if [ -d "${D}" ]; then
        #enter the folder
        cd "${D}"
        #for every file in the directory with .avi
        for F in *.avi; do
            #if the mp4 does not already exist
            if [ !  -f "${F%%.avi}.mp4" ]; then
                #print what you are doing
                SECONDS=0
                echo "converting ${F%%.avi}"
                #ffmpeg convert to mp4
                ffmpeg -i "${F}" "${F%%.avi}.mp4" &> /dev/null
                echo "done, took $SECONDS seconds."

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
    #if the mp4 does not already exist
    if [ !  -f "${F%%.avi}.mp4" ]; then
        echo "converting ${F%%.avi}"
        #ffmpeg convert to mp4
        ffmpeg -i "${F}" "${F%%.avi}.mp4" &> /dev/null
        echo "done"
    fi
    #clear
    #echo "done with file"
done
#print done
echo "done"
