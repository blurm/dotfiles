## Install oh-my-zsh plugin and other terminal tools {
    echo '---------------------- zsh-syntax-highlighting ---------------------'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo '---------------------- file path jumping ---------------------'
    git clone https://github.com/skywind3000/z.lua ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
## }
