#!/bin/bash

# Arguments:
# * $1: path to texlive distribution ISO
# * $2: name of the distribution to be installed (e.g., 2018, 2019)

# mount the iso distribution
sudo mkdir /media/iso
# mount iso from given path to /media/iso
sudo mount -o loop $1 /media/iso

# Prepare installation directory, provide as parameter the distribution name
sudo rm -r -f /usr/local/texlive/$2
sudo mkdir /usr/local/texlive/$2
sudo chown $USER:$USER /usr/local/texlive/$2

# run installation
/media/iso/install-tl --profile texlive.profile

# create symbolic link to distribution 
sudo rm /usr/local/texlive/latest
sudo ln -s /usr/local/texlive/$2 /usr/local/texlive/latest

# unmount installation media
sudo umount /media/iso

# TODO manually: add /usr/local/texlive/latest to your PATH
