# Path to your oh-my-zsh installation.
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
else
    export ZSH=/usr/share/oh-my-zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
unsetopt INC_APPEND_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
    dircycle \
    gpg-agent \
    gitfast \
    git-extras \
    httpie \
    history \
    jsontools \
    lol \
    mercurial \
    nyan \
    pip \
    python \
    screen \
    sprunge \
    sudo \
    supervisor \
    svn \
    systemd \
    tmux \
    urltools \
    web-search \
)


# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]* }//,/ })' 


# Manually set language environment
export LANG=en_US.UTF-8


# Preferred editor depending on what's available
if [[ -f $(which nvim) ]]; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
export VISUAL=$EDITOR


# Setup homeshick
source $DOTS/repos/homeshick/homeshick.sh
fpath=($DOTS/repos/homeshick/completions $fpath)


#####
## Aliases
###

alias l="ls -Ah --color=auto"
alias la="ls -ah --color=auto"
alias ll="ls -lAh --color=auto"
alias lt="ls -lAhrt --color=auto"

alias t='tail -f'

# Command line head / tail shortcuts 
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null" 
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'

alias e="emacs -nw"
alias vi="$EDITOR"
alias vim="$EDITOR"

alias watch="watch --color"

alias homesick="homeshick"


#####
## Paths
###

# sbins
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# bin share
[ -d "$HOME/shares/code/bin" ] && export PATH="$PATH:$HOME/shares/code/bin"

# $HOME/bin
export PATH="$PATH:$HOME/bin"

setopt auto_cd
cdpath=($HOME/src/perforce $HOME/src)


#####
## Host Includes
###

source $DOTS/hosts/$HOSTCLASS/zshrc


###############################################################################
# Last line ###################################################################
source $ZSH/oh-my-zsh.sh
