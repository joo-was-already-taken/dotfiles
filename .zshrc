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
  if [ $? = 0 ]; then
    cd $target_path
  fi
}
# open file in nvim with fzf
function ffv () {
  target_path="$(fd --type f --hidden --exclude .git | fzf)"
  if [ $? = 0 ]; then
    vim $target_path
  fi
}

function pomodoro () {
  i=0
  while true; do
    countdown 25m
    spd-say "Finished cycle number ${i}"
    ((i++))
    countdown 5m
    spd-say "Starting cycle number ${i}"
  done
}

alias mupdf=mupdf-gl

# python stuff
# alias python='/usr/bin/python3.12'
alias py=/usr/bin/python3.12
alias pytest='py -m pytest -W ignore::DeprecationWarning'

alias ip='ip -color=auto'

# sussy
alias sus='systemctl suspend'

alias cmake='~/cmake-3.29.0-rc3-linux-x86_64/bin/cmake'

# haskell
#[ -f "/home/joo/.ghcup/env" ] && source "/home/joo/.ghcup/env" # ghcup-env

# completion for zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
# syntax highlighting for zsh
source /home/joo/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# launch starship
eval "$(starship init zsh)"

# if [ "$TMUX" = "" ]; then tmux; fi

[ -f "/home/joo/.ghcup/env" ] && source "/home/joo/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
