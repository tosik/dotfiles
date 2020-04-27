#!/bin/sh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim/ftplugin
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/nvim/ftplugin/go.vim ~/.config/nvim/ftplugin/go.vim

