#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/bin
ln -sf ~/dotfiles/tmux-pane-border ~/bin/tmux-pane-border
chmod a+x ~/bin/tmux-pane-border
