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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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
PROMPT=$'%(?.\U1F439.\U274C)  '
SPROMPT="%r is correct? [n,y,a,e]: "

# alias
alias ll="ls -lG"
alias la="ls -laG"
alias du="du -h"
alias g="git"

alias vim='/usr/bin/vim'

# time
REPORTTIME=3

