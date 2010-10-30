# complete
autoload -Uz compinit
compinit -u
setopt auto_pushd
unsetopt AUTO_MENU

# language
# export LANG=ja_JP.UTF-8
#export LANG=en_EN.UTF-8
export LANG=C

# svn
export SVN_EDITOR='vim'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
rvm use 1.9.2-p0

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

# view
setopt list_packed
setopt nolistbeep
# RPROMPT=''
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
autoload -U colors
colors

# alias
alias ll="ls -l --color"
alias la="ls -la --color"
alias du="du -h"

# screen
if [ $SHLVL = 1 ]; then
        screen -R
        exit
fi

