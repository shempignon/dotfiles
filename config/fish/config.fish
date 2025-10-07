set -gx EDITOR nvim
set -gx TERMINAL wezterm

set -U fish_greeting

if test "$XDG_SESSION_TYPE" = "wayland"
    set -gx MOZ_ENABLE_WAYLAND 1
end

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
alias dlg="docker compose logs -f"

starship init fish | source
direnv hook fish | source
