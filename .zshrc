# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#alias rg="~/mydata/linux\ tools/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/damon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(vi-mode git z extract command-not-found zsh-syntax-highlighting colored-man-pages)
plugins=(colorize git z.lua extract command-not-found zsh-syntax-highlighting colored-man-pages)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line)
#typeset -gA ZSH_HIGHLIGHT_STYLES
# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=034
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=034
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

#{{{ History Stuff

# Where it gets saved. Default is ~/.zsh_history
#HISTFILE=~/.history

HISTSIZE=1000000      # Number of lines kept in memories
SAVEHIST=1000000      # Number of lines kept in history file

# Change shell edit mode from emac to vi
#set -o vi

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS      # If a new line is a duplicate, remove the older line
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_FIND_NO_DUPS         # Ignore duplicates when searching
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
#setopt HIST_NO_STORE             # Don't store `history` or `fc` command lines
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt no_nomatch                # By default, if a command line contains a globbing expression which doesn't match anything, Zsh will print the error message you're seeing, and not run the command at all.
#}}}

# fzf settings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -g glob : 搜索模式
# --files : 显示要搜的文件（但不进行搜索），与-g搭配显示符合的文件路径
# --no-ignore : Don't respect ignore files (.gitignore, .ignore, etc.)
# --hidden : Search hidden directories and files
# --follow : Follow symlinks.
# 2> /dev/null : 不回显错误信息
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,*.swp,dist,*.coffee}/*" 2> /dev/null'
#export FZF_ALT_C_COMMAND="bfs -type d -nohidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='rg --files --no-ignore --hidden --follow --glob \
    "!{.git/,.gvfs,.cache/dconf,.config/chromium,.config/pulse,.config/google-chrome}*" \
    --null /home/damon/ | xargs -0 dirname | uniq'
# hl - 匹配输入的字符
# fg - 未高亮的条目
# fg+ - 高亮选中的条目
# pointer - 遍历箭头
export FZF_DEFAULT_OPTS='
--reverse --ansi
--color fg:248,bg:237,hl:208,fg+:#fbf1c7,bg+:239,hl+:208
--color info:108,prompt:208,spinner:108,pointer:208,marker:168
'
#### customized alias
alias sz="source $HOME/.zshrc"
alias wd="wd -o"
alias yays="yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S"
alias yayr="yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs"
alias c="cheat"
alias ce="cheat -e"
alias t="python ~/git4install/t/t.py --task-dir ~/myStaff/tasks --list tasks"
alias tf="python ~/git4install/t/t.py --task-dir ~/myStaff/tasks --list tasks -f"
alias ls="lsd"
alias la='ls -a'
alias lla='ls -lAh'
#alias lt='ls --tree'
alias td='todoist --color --csv'
alias ra='ranger'
alias vim='nvim'
alias scstart='sudo systemctl start'
alias scstop='sudo systemctl stop'
alias scstatus='sudo systemctl status'
alias scenable='sudo systemctl enable'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
