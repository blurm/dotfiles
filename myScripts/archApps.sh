
    ## Internet {
    echo '----------------- google-chrome, chromium -------------------'
    yay -S chromium
    ## }

    echo '------------------------ calibre ------------------------------'
    yay -S  calibre
    yay -Sy man

## System tools {
    echo '----------------- System Tools -------------------'
    echo '----------------- htop -------------------'
    yay -S htop
    #echo '----------------- Input Methods -------------------'
    yay -S fcitx-im fcitx-configtool fcitx-rime
    yay -S fcitx-skins

    echo '----------------- Dolphin, kate -------------------'
    yay -Sy dolphin kate

    echo '----------------- ranger (file manager)-------------------'
    yay -S ranger
    # Plugins for ranger
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
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
## }

    # picom(fork from compton), a compositor for Xorg
    echo '----------------------- picom ---------------------------'
    yay -S picom

    # Wallpaper
    yay -S feh

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
    yay -S ttf-material-design-icons ttf-devicons vim-devicons ttf-font-awesome
    yay -S nerd-fonts-complete
    echo '----------------------- powerline ---------------------------'
    yay -S powerline powerline-fonts
    yay -S noto-fonts-emoji
    # font for code or terminal
    yay -S ttf-dejavu otf-mplus ttf-roboto
    yay -S ttf-input ttf-share-gf ttf-fira-code
    #yay -S ttf-nerd-fonts-input
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

    echo '----------------------- uget ---------------------------'
    yay -S uget uget-integrator-chrome
    echo '----------------------- aria2 ---------------------------'
    yay -S aria2


## Developing tools {
    echo '----------------- Developing Tools -------------------'
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


## Developing tools {
    echo '----------------- Developing Tools -------------------'
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

## Install oh-my-zsh plugin and other terminal tools {
    echo '---------------------- zsh-syntax-highlighting ---------------------'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo '---------------------- file path jumping ---------------------'
    git clone https://github.com/skywind3000/z.lua ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
## }

## recover all settings from my dotfiles {
    git clone --no-checkout https://github.com/blurm/dotfiles.git ~/.myconfigs
    cd ~/.myconfigs
    git config core.worktree "../../"
    git reset --hard origin/master
## }