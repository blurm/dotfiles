#!/bin/bash

#####################################
# System install script for Arch    #
#####################################


### 安装软件
    mkdir -p ~/git4install

## Xorg & DM {
    sudo pacman -Sy xorg-server xorg-xinit
    sudo pacman -Sy lightdm lightdm-webkit2-greeter
    sudo systemctl enable lightdm
## }

## Basic Tools {
    echo '------------ base devel  -------------'
    sudo pacman -S base-devel
    sudo pacman -S linux-headers
    sudo pacman -S cmake

    echo '------------ git -------------'
    sudo pacman -Sy  git
    git config --global user.name "damon"
    git config --global user.email "blurm@126.com"

    echo '------------------------ yay(from archlinuxcn) ------------------------------'
    sudo pacman -S yay
    #cd git4install
    #git clone https://aur.archlinux.org/yay.git
    #cd yay
    #makepkg -si

    yay -Sy man
    # A simple text edit tool for later use
    echo '------------------------ ed ------------------------------'
    yay -Sy ed
## }

## Internet {
    echo '----------------- google-chrome -------------------'
    yay -Sy chromium
## }

echo '------------------------ calibre ------------------------------'
    yay -Sy  calibre


## System tools {
    echo '----------------- System Tools -------------------'
    echo '----------------- htop -------------------'
    yay -Sy htop
    #echo '----------------- Input Methods -------------------'
    yay -Sy fcitx-im fcitx-configtool fcitx-rime
    yay -Sy fcitx-qt5 fcitx-skins
    #yay -Sy fcitx-sogoupinyin

    # create .xprofile
    #(
        #echo '$a';
        #echo 'export GTK_IM_MODULE=fcitx';
        #echo 'export QT_IM_MODULE=fcitx';
        #echo 'export XMODIFIERS="@im=fcitx"';
        #echo '.';
        #echo 'wq'
    #) | ed -s ~/.xprofile

    echo '----------------- Dolphin, kate -------------------'
    yay -Sy dolphin kate


    echo '----------------- unrar -------------------'
    sudo yay -Sy unrar


    echo '----------------- ranger (file manager)-------------------'
    yay -Sy ranger
    # Dependencies for ranger
    # Syay -Sy atool mediainfo
    # yay -Sy xsel

    #echo '----------------- minidlna -------------------'
    #sudo pacman -s  minidlna

    # Psensor 检查CPU温度
    echo '----------------- lm-sensors, hddtemp -------------------'
    yay -Sy lm_sensors hddtemp
    ## 检测硬件传感器
    #sudo sensors-detect
    #sensors
    echo '----------------- psensor -------------------'
    yay -Sy psensor


    # Logitech mouse
    echo '----------------- xbindkeys -------------------'
    yay -Sy xbindkeys

    # Partition Tools
    echo '----------------- gparted -------------------'
    yay -Sy gparted

    # Copy to Or paste to X clipboard
    echo '----------------- xclip -------------------'
    sudo pacman -S  xclip
## }

## Window Manager {
    # i3-wm
    #echo '----------------------- i3wm ---------------------------'
    #yay -Sy i3-gaps

    #echo '----------------------- bspwm ---------------------------'
    yay -Sy bspwm sxhkd

    # polybar - status bar tools
    echo '----------------------- polybar ---------------------------'
    yay -Sy polybar
    yay -S alsa-utils
    yay -S network-manager-applet

    # picom(fork from compton), a compositor for Xorg
    echo '----------------------- picom ---------------------------'
    yay -Sy picom

    # Wallpaper
    yay -Sy feh

    echo '----------------------- rofi ---------------------------'
    yay -S rofi

## }

## Virtual Machine {
    echo '----------------------- virtualbox ---------------------------'
    yay -Sy virtualbox
## }

## 系统美化 {
    # theme tools
    echo '----------------------- Theme config tools ---------------------------'
    yay -Sy kvantum-qt5 qt5ct
    yay -Sy sierra-gtk-theme-git
    yay -Sy gtk-engine-murrine gtk-engines
    # 美化系统，类似Unity-tweak-tools，在这里修改theme, only for GTK+
    yay -Sy lxappearance
    #echo '----------------------- fonts ---------------------------'
    # TODO 安装字体(i3,awesome font)
    echo '----------------------- Icon ---------------------------'
    yay -S la-capitaine-icon-theme
    echo '----------------------- Icon Fonts ---------------------------'
    #yay -Sy ttf-font-awesome ttf-material-design-icons
    yay -Sy nerd-fonts-complete
    echo '----------------------- powerline ---------------------------'
    yay -Sy powerline powerline-fonts
    yay -Sy noto-fonts-emoji
    # font for code or terminal
    yay -Sy ttf-dejavu otf-mplus ttf-meslo ttf-roboto
    yay -Sy adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts adobe-source-han-mono-otc-fonts
## }

## Entertainment
    echo '----------------------- smplayer ---------------------------'
    yay -Sy smplayer
    #echo '----------------------- kodi ---------------------------'
    #yay -Sy kodi

## Photo & Media
    # echo '----------------------- Darktable ---------------------------'
    # yay -Sy darktable



## Downloading Tools {
    echo '----------------------- uget ---------------------------'
    yay -Sy uget uget-integrator-chrome
    echo '----------------------- aria2 ---------------------------'
    yay -Sy aria2
## }


## Developing tools {
    echo '----------------- Developing Tools -------------------'
    echo '----------------------- vim ---------------------------'
    # vim doesn't support clipboard
    yay -Sy gvim
    echo '----------------------- meld ---------------------------'
    # diff tool to comparing files
    yay -Sy meld
    echo '----------------------- neovim ---------------------------'
    yay -Sy neovim

    # Java
    # Eclipse (will install openjdk automatically)
    yay -Sy eclipse

    # Python
    #sudo apt -y install phantomjs
    yay -Sy python-requests flake8 python-selenium python-beautifulsoup4 python-jedi autopep8 yapf
    yay -Sy python2-pyquery python-pyquery

    # nodejs
    yay -Sy nodejs npm
    # Error and problem detecting tool for Vim
    #sudo npm install -g jshint
    #sudo npm install -g tern
    #yay -Sy nodejs-jshint nodejs-tern
## }

## Clone dotfiles from Git {
    echo '---------------------- myconfigs ---------------------'
    git clone https://github.com/blurm/myconfigs ~/git4install/myconfigs
## }

## Install plugins for Vim {
    echo '---------------------- vim plugins ---------------------'
    #cp ~/git4install/myconfigs_temp/{.vimrc,.viminfo} /home/damon
    cd ~/.vim/autoload
    git clone https://github.com/blurm/damonvim.git
    #vim +PluginInstall +qall

    #echo '---------------------- YouCompleteMe ---------------------'
    #cd ~/.vim/bundle/YouCompleteMe
    #sudo ./install.py
    #cd ~

    #echo '---------------------- ropevim ---------------------'
    #cd ~/.vim/bundle/ropevim
    #sudo python setup.py install
    #cd ~

    #echo '---------------------- ctags for tagbar ---------------------'
    #sudo apt -y install exuberant-ctags
## }

## Terminal Tools {
    echo '--------------------- fuzzy search ----------------------------'
    yay -S fzf ripgrep
    echo '--------------------- urxvt and perl scripts ----------------------------'
    yay -Sy rxvt-unicode-256xresources urxvt-clipboard urxvt-font-size-git

    ## Need to put it at last, since chsh will interrupt the install process
    echo '--------------------- zsh ----------------------------'
    # Zsh
    yay -Sy zsh
    # on my zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## }
