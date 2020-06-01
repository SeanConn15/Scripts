#!/bin/bash
cd ~/Documents
if [ $# -eq 1 ]; then
    #save arguments
    args="$@"
    #prepend zero if needed
    if [ $((args[0])) -le 9 ]; then
        args[0]=0$args
    fi
    #argument is now just $args for some reason
    echo "-----USING VPN SERVER $args------"
    sudo openvpn --mute-replay-warnings --config ./configs/ipvanish-US-Chicago-chi-a$args.ovpn --auth-user-pass .stuff
else
    echo pants
    echo "-----USING DEFAULT SERVER $args------"
    sudo openvpn --mute-replay-warnings --config ./configs/ipvanish-US-Chicago-chi-a23.ovpn --auth-user-pass .stuff
fi

