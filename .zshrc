export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="devcontainers"
CASE_SENSITIVE="true"
zstyle ':omz:update' frequency 30
plugins=(git vi-mode docker git-extras ubuntu terraform brew kubectl helm gcloud aws)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
alias btcm="better-commits"