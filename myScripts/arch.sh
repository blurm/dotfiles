#!/bin/bash

#####################################
# System install script for Arch    #
#####################################


### 安装软件
    mkdir -p ~/git4install

## Xorg & DM {
    sudo pacman -Sy xorg-server xorg-xinit
    sudo pacman -S lightdm lightdm-webkit2-greeter
    sudo systemctl enable lightdm
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

    yay -Sy man
    # A simple text edit tool for later use
    echo '------------------------ ed ------------------------------'
    yay -S ed
## }

## Internet {
    echo '----------------- google-chrome, chromium -------------------'
    yay -S chromium
## }

echo '------------------------ calibre ------------------------------'
    yay -S  calibre


## System tools {
    echo '----------------- System Tools -------------------'
    echo '----------------- htop -------------------'
    yay -S htop
    #echo '----------------- Input Methods -------------------'
    yay -S fcitx-im fcitx-configtool fcitx-rime
    yay -S fcitx-skins
    #yay -S fcitx-sogoupinyin

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
    sudo yay -S unrar


    echo '----------------- ranger (file manager)-------------------'
    yay -S ranger
    # Dependencies for ranger
    # Syay -S atool mediainfo
    # yay -S xsel

    #echo '----------------- minidlna -------------------'
    #sudo pacman -s  minidlna

    # Psensor 检查CPU温度
    echo '----------------- lm-sensors, hddtemp -------------------'
    yay -S lm_sensors hddtemp
    ## 检测硬件传感器
    #sudo sensors-detect
    #sensors
    echo '----------------- psensor -------------------'
    yay -S psensor


    # Logitech mouse
    echo '----------------- xbindkeys -------------------'
    yay -S xbindkeys

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

    # polybar - status bar tools
    echo '----------------------- polybar ---------------------------'
    yay -S polybar
    yay -S alsa-utils
    yay -S network-manager-applet

    # picom(fork from compton), a compositor for Xorg
    echo '----------------------- picom ---------------------------'
    yay -S picom

    # Wallpaper
    yay -S feh

    echo '----------------------- rofi ---------------------------'
    yay -S rofi

## }

## Virtual Machine {
    echo '----------------------- virtualbox ---------------------------'
    yay -S virtualbox
## }

## 系统美化 {
    # theme tools
    echo '----------------------- Theme config tools ---------------------------'
    yay -S kvantum-qt5 qt5ct
    yay -S sierra-gtk-theme-git
    yay -S gtk-engine-murrine gtk-engines
    # 美化系统，类似Unity-tweak-tools，在这里修改theme, only for GTK+
    yay -S lxappearance
    #echo '----------------------- fonts ---------------------------'
    # TODO 安装字体(i3,awesome font)
    echo '----------------------- Icon ---------------------------'
    yay -S la-capitaine-icon-theme
    echo '----------------------- Icon Fonts ---------------------------'
    yay -S otf-font-awesome ttf-material-design-icons ttf-devicons vim-devicons
    yay -S nerd-fonts-complete
    echo '----------------------- powerline ---------------------------'
    yay -S powerline powerline-fonts
    yay -S noto-fonts-emoji
    # font for code or terminal
    yay -S ttf-dejavu otf-mplus ttf-meslo ttf-roboto
    yay -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
    #yay -S adobe-source-han-mono-otc-fonts
    echo '----------------------- font manager ---------------------------'
    yay -S font-manager
## }

## Entertainment
    echo '----------------------- smplayer ---------------------------'
    yay -S smplayer
    #echo '----------------------- kodi ---------------------------'
    #yay -S kodi

## Photo & Media
    # echo '----------------------- Screen shot ---------------------------'
    yay -S flameshot
    # echo '----------------------- Darktable ---------------------------'
    # yay -S darktable



## Downloading Tools {
    echo '----------------------- uget ---------------------------'
    yay -S uget uget-integrator-chrome
    echo '----------------------- aria2 ---------------------------'
    yay -S aria2
## }


## Developing tools {
    echo '----------------- Developing Tools -------------------'
    echo '----------------------- vim ---------------------------'
    # vim doesn't support clipboard
    #yay -S gvim
    echo '----------------------- meld ---------------------------'
    # diff tool to comparing files
    yay -S meld
    echo '----------------------- neovim ---------------------------'
    yay -S neovim

    # Java
    # Eclipse (will install openjdk automatically)
    #yay -S eclipse

    # Python
    #sudo apt -y install phantomjs
    yay -S python-requests flake8 python-selenium python-beautifulsoup4 python-jedi autopep8 yapf
    yay -S python2-pyquery python-pyquery

    # nodejs
    yay -S nodejs npm
    # Error and problem detecting tool for Vim
    #sudo npm install -g jshint
    #sudo npm install -g tern
    #yay -S nodejs-jshint nodejs-tern
## }

## Clone dotfiles from Git {
    #echo '---------------------- myconfigs ---------------------'
    #git clone https://github.com/blurm/myconfigs ~/git4install/myconfigs
## }

## Install plugins for Vim {
    echo '---------------------- vim plugins ---------------------'
    #cp ~/git4install/myconfigs_temp/{.vimrc,.viminfo} /home/damon
    mkdir -p ~/.vim/autoload
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
    yay -S rxvt-unicode-256xresources urxvt-clipboard urxvt-font-size-git

    ## Need to put it at last, since chsh will interrupt the install process
    echo '--------------------- zsh ----------------------------'
    # Zsh
    yay -S zsh
    # on my zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo '---------------------- zsh-syntax-highlighting ---------------------'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo '---------------------- file path jumping ---------------------'
    git clone https://github.com/skywind3000/z.lua ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
## }
