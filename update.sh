#!/usr/bin/sh

mkdir zsh
mkdir starship
mkdir tmux

cp ~/.zshrc zsh/
cp ~/.config/starship.toml starship/
cp -r ~/.config/tmux/tmux.conf tmux/

cp -r ~/.config/nvim/ .
cp -r ~/.config/alacritty/ .
