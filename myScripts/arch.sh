#!/bin/bash

#####################################
# System install script for Arch    #
#####################################

### Adjust the time, or the request would be rejected by server
timedatectl set-ntp true

### Add archlinux repo
echo '[archlinuxcn]' | sudo tee -a /etc/pacman.conf
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' | sudo tee -a /etc/pacman.conf
sudo pacman -Sy archlinuxcn-keyring

### Create the temp dir for git
    mkdir -p ~/git4install

## Xorg & DM {
    sudo pacman -Sy xorg-server xorg-xinit
    sudo pacman -S lightdm lightdm-webkit2-greeter
    sudo pacman -S lightdm-webkit-theme-aether
    #sudo systemctl enable lightdm
## }

## Basic Tools {
    echo '------------ base devel  -------------'
    sudo pacman -S base-devel
    sudo pacman -S linux-headers
    sudo pacman -S cmake

    echo '------------ git -------------'
    sudo pacman -S  git
    git config --global user.name "damon"
    git config --global user.email "blurm@126.com"

    echo '------------------------ yay(from archlinuxcn) ------------------------------'
    sudo pacman -S yay
    #cd git4install
    #git clone https://aur.archlinux.org/yay.git
    #cd yay
    #makepkg -si
## }

    echo '----------------- unrar -------------------'
    sudo yay -S unrar
    echo '----------------- unzip -------------------'
    sudo yay -S unzip


    # Partition Tools
    echo '----------------- gparted -------------------'
    yay -S gparted

    # Copy to Or paste to X clipboard
    echo '----------------- xclip -------------------'
    sudo pacman -S  xclip
## }

## Window Manager {
    # i3-wm
    #echo '----------------------- i3wm ---------------------------'
    #yay -S i3-gaps

    #echo '----------------------- bspwm ---------------------------'
    yay -Sy bspwm sxhkd
    # for scratchpad floating
    yay -S xdotool

    # polybar - status bar tools
    echo '----------------------- polybar ---------------------------'
    yay -S polybar
    yay -S alsa-utils
    yay -S network-manager-applet
    # for json parsing. Used by weather and pm2.5 module
    yay -S jq


    echo '----------------------- rofi ---------------------------'
    yay -S rofi

## }

## Downloading Tools {
    echo '----------------------- wget ---------------------------'
    yay -S wget
## }


## Terminal Tools {
    echo '--------------------- fuzzy search ----------------------------'
    yay -S fzf ripgrep

    echo '--------------------- cheat sheet ----------------------------'
    yay -S cheat

    echo '--------------------- urxvt and perl scripts ----------------------------'
    yay -S rxvt-unicode-pixbuf urxvt-clipboard urxvt-font-size-git

    ## Need to put it at last, since chsh will interrupt the install process
    echo '--------------------- zsh ----------------------------'
    # Zsh
    yay -S zsh
    # on my zsh
    # When checkout arch.sh, oh my zsh theme was checkouted too. Need to delete
    # it before install
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## }
