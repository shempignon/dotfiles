set -gx EDITOR nvim
set -gx TERMINAL wezterm

set -U fish_greeting

alias g="git"
alias c="cargo"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias gst="git status"
alias l="exa --long --group --time-style long-iso --header --all"
alias ll="exa --long --group --time-style long-iso --header --all"
alias dup="docker compose up --detach --remove-orphans"
alias dwn="docker compose down --remove-orphans"
alias vpn="ssh -TND 4711 blanc"

starship init fish | source
fnm env --use-on-cd | source
pyenv init - | source
