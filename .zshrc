# complete
autoload -Uz compinit
compinit -u
setopt auto_pushd
unsetopt AUTO_MENU

# path
export PATH=~/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=~/pear/bin:$PATH
export PATH=~/local/node/bin:$PATH
export PATH=/usr/games:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=~/.airenv/sdks/current/bin:$PATH
export PATH=~/.airenv/sdks/current/lib/android/bin:$PATH

# language
export LANG=ja_JP.UTF-8
#export LANG=en_EN.UTF-8
#export LANG=C

# svn
export SVN_EDITOR='vim'

export FLEX_HOME=/Applications/FDT/plugins/com.powerflasher.fdt.shippedFlexSDK4_4.0.0.14159_1000/flex

# git
autoload bashcompinit
bashcompinit
#source ~/git-completion.bash

# rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#rvm use 1.9.3

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

# view
setopt list_packed
setopt nolistbeep
# RPROMPT=''
PROMPT=$'%(?.\U1F439.\U274C)  '
SPROMPT="%r is correct? [n,y,a,e]: "
autoload -U colors
colors

# alias
alias ll="ls -lG"
alias la="ls -laG"
alias du="du -h"
alias g="git"

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='vi'
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'

alias gn='growlnotify'
alias tgn='tail -n3|growlnotify'

alias svn16='/Applications/Xcode.app/Contents/Developer/usr/subversion-1.6/bin/svn'
alias vim='/usr/bin/vim'

# screen
function title {
  #screen -X eval "title '$1'"
  tmux rename-window $1
}
function chpwd() {
#  title $(basename $(pwd))
}
#if [ $SHLVL = 1 ]; then
#        screen -U -R -d
#        exit
#fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin/

export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
