#!/bin/bash
# first argument is the directory to use, if there's no arguments it uses ~/Documents/openvpn
# reqires a directory to run with this format:
# ca.ipvanish.com.crt: certificate for ipvanish stuff
# .auth: a file with the username and password of the openvpn account as specified by --auth-user-pass
# configs: a folder full of openvpn files

#deal with operands
configdir="$HOME/Documents/openvpn"
server=23
while getopts 'd:s:h' option; do
    case "$option" in
        d) 
            configdir=${OPTARG}
            ;;
        s) 
            server=${OPTARG}
            ;;
        h) 
            echo "Usage: $0 [-h] [-d <directory>] [-s <server number>]"
            exit 1;
            ;;
    esac
done


#try to go to the directory
cd "$configdir"
if [ $? -ne 0 ]; then
    echo "directory does not exist or is not accessable" >&2
    exit 1
fi

#execute the command to start the vpn server
#prepend zero if needed
if [ $(($server)) -le 9 ]; then
    server=0$server
fi
#argument is now just $args for some reason
echo "-----USING VPN SERVER $server------"
sudo openvpn --mute-replay-warnings --config ./configs/ipvanish-US-Chicago-chi-a$server.ovpn --auth-user-pass .auth
