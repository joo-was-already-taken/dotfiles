#!/usr/bin/sh

mkdir zsh
mkdir starship

cp ~/.zshrc zsh/
cp ~/.config/starship.toml starship/

cp -r ~/.config/tmux/ .
cp -r ~/.config/nvim/ .
cp -r ~/.config/alacritty/ .
