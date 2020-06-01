#!/bin/sh
#remove libc++ directory
rm -rf ./libc++
#clone from AUR
git clone https://aur.archlinux.org/libc++.git
#go into directory 
cd ./libc++/
#make package
makepkg -si --nocheck --noconfirm
#print done
clear
echo done
