set -gx EDITOR nvim
set -gx TERMINAL wezterm
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx _JAVA_AWT_VM_NONPARENTING 1

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

starship init fish | source
fnm env --use-on-cd | source
