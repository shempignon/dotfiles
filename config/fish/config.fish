set -gx EDITOR nvim
set -gx TERMINAL alacritty
set -gx LC_CTYPE=en_US.UTF-8
set -gx LC_ALL=en_US.UTF-8

set -U fish_greeting

alias g="git"
alias c="cargo"
alias d="docker-compose run --rm command"
alias k="kubectl"
alias gst="git status"
alias dup="docker-compose up --detach"
alias dwn="docker-compose down --remove-orphans"
alias cat="bat"
alias vi="nvim"
alias vim="nvim"
alias l="exa --long --group --time-style long-iso --header --all"
alias ll="exa --long --group --time-style long-iso --header --all"


starship init fish | source
