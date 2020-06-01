#!/bin/sh


#ask to remove libc++ directory if it exists
if [ -d "./libc++" ]; then 
    echo "./libc++ exists, install existing download? [y/N]"
    read ans
    if [ "$ans" != "y" -a "$ans" != "Y" ]; then
        #remove what exists
        rm -rf ./libc++
    fi
fi

# if downloading a new copy of libc++
if [ ! -d "./libc++" ]; then
    #clone from AUR
    git clone https://aur.archlinux.org/libc++.git
fi

#go into directory 
cd ./libc++/
#if the installed version is the same as the downloaded, do nothing
#gets the version string for the installed libc++
_insver=$(pacman -Q libc++ | cut -d" " -f 2)
#gets the version string from the PKGBUILD
_pkgver=$(cat PKGBUILD | grep pkgver= | cut -c 8-)
if [[ $_insver == *"$_pkgver"* ]]; then
    echo "libc++ is already up to date."
    exit 0
fi
#make package
makepkg -si --nocheck --noconfirm
