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
#export PATH="/usr/local/Cellar/llvm/8.0.0_1/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$DEVKITARM/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# pyenv
if type pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/.pyenv/versions/3.7.1/include/python3.7m/"
fi

# direnv
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# mac
case ${OSTYPE} in
  darwin*)
  export PATH="/usr/bin:$PATH"
  ;;
esac

# msys
case ${OSTYPE} in
  msys*)
  export PATH="/mingw64/bin:$PATH"
  alias vim="vim" # come back, vim!
  ;;
esac

# capturing stdio (usage: capture_stdio [pid])
capture_stdio() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}

# rbenv
if type rbenv >/dev/null 2>&1; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# mysql-client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# golang
export GO111MODULE=on


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function edit-git-changed-file {
  local s1="$(git status -s -u --no-renames | grep -v -E '^D ')"
  if [ $s1 ]; then
    local s2="$(echo -e $s1 | fzf -1 --preview "$(fzf-preview-git-file)" | cut -c4-)"
    [ $s2 ] && shift $# && vi $s2
  fi
}

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bat
export BAT_THEME="Coldark-Dark"
