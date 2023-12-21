# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify
unsetopt beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# common
alias grep='grep --color=auto'
alias ls=exa
alias ll='ls -lah'
alias la='ls -a'

# apts
alias aptup='sudo apt update && sudo apt upgrade -y'
alias aptupd='sudo apt update'
alias apts='apt search'
alias apti='sudo apt install'
alias aptupi='sudo apt update && sudo apt install'
alias aptrem='sudo apt remove --purge --autoremove'

# the most commonner
alias vim=nvim

# cd to dir with fzf
function ffd () {
  target_path="$(fd --type d --hidden --exclude .git | fzf)"
  if [ "$target_path" != "" ]; then
    cd $target_path
  fi
}
# open file in nvim with fzf
function ffv () {
  target_path="$(fd --type f --hidden --exclude .git | fzf)"
  if [ "$target_path" != "" ]; then
    vim $target_path
  fi
}
# alias ffv='fd --type f --hidden --exclude .git | fzf | xargs nvim'

alias mupdf=mupdf-gl

# python stuff
alias python='/usr/bin/python3.12'
alias py=python
alias pytest='python -m pytest -W ignore::DeprecationWarning'

# sussy
alias sus='systemctl suspend'

# completion for zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
# syntax highlighting for zsh
source /home/joo/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# launch starship
eval "$(starship init zsh)"

# if [ "$TMUX" = "" ]; then tmux; fi
