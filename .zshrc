# good bye, vim
alias vim="nvim"

# complete
autoload -Uz compinit
compinit -u
setopt auto_pushd
unsetopt AUTO_MENU

# color
autoload -U colors
colors

# language
export LANG=ja_JP.UTF-8

# svn
export SVN_EDITOR='vim'

# git
autoload bashcompinit
bashcompinit

# less
export LESSCHARSET=utf-8

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# bind
bindkey -v

# C-P, C-N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward

# prompt
PROMPT=$'%(?.[✔].[✘]) '

# precmd
function precmd() {
    # refresh tmux
    if [ ! -z $TMUX ]; then
        tmux refresh-client -S
    fi
}

# alias
alias ll="ls -lG"
alias la="ls -laG"
alias du="du -h"
alias g="git"

# time
REPORTTIME=3

# devkitpro
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

# path
export PATH="$HOME/bin:$PATH"
export PATH="$DEVKITARM/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:$PATH"
export PATH="/usr/local/Cellar/llvm/7.0.0/bin:$PATH"

# rbenv
if type rbenv >/dev/null 2>&1; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/.pyenv/versions/3.7.1/include/python3.7m/"

# direnv
eval "$(direnv hook zsh)"

