export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="devcontainers"
CASE_SENSITIVE="true"
zstyle ':omz:update' frequency 30
plugins=(git vi-mode docker git-extras ubuntu terraform kubectl helm gcloud aws)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
alias bat="batcat"
alias btcm="better-commits"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias k='kubectl'
alias kgp='kubectl get pods'
alias dive='docker run -it --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive'
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias ln="ln -v"
alias mkdir="mkdir -v"
alias history="history -E"
alias find='bfs'
alias kubectl='kubecolor'
alias cat='bat --paging=never --style=plain'
alias grep="ugrep --color=auto"

git-sendit () {
  local branch="$(git branch --show-current)"
  git add .
  if [ ! -z "$1" ]
  then
    local msg="trivial"
    git commit -m ${msg}
  else
    git commit
  fi
  git push origin "${branch}"
}
