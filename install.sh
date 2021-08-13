#!/usr/bin/env bash

set -eu

printf '\n'

REQUIRED_PACKAGES=("alacritty" "bat" "curl" "dex" "diskonaut" "dunst" "exa" "feh" "fish" "font-victor-mono" "fzf" "i3-gaps" "i3lock" "i3blocks" "nodejs" "npm" "neovim" "noto-fonts" "noto-fonts-emoji" "noto-fonts-cjk" "noto-fonts-extra" "polybar" "rofi" "rust-analyzer" "starship" "ttc-iosevka" "ttf-fira-code" "xclip" "xsel" "xkb-qwerty-fr" "yarn")
PARU_REPO="https://aur.archlinux.org/paru.git"
SCRIPT_PATH="$(dirname $(realpath $0))"
BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"

info() {
  printf '%s\n' "${BOLD}${GREY}>${NO_COLOR} $*"
}

warn() {
  printf '%s\n' "${YELLOW}! $*${NO_COLOR}"
}

error() {
  printf '%s\n' "${RED}x $*${NO_COLOR}" >&2
}

completed() {
  printf '%s\n' "${GREEN}✓${NO_COLOR} $*"
}

has() {
  command -v "$1" 1>/dev/null 2>&1
}

elevate_priv() {
  if ! has sudo; then
    error 'Could not find the command "sudo", needed to get permissions for install.'
    info "If you are on Windows, please run your shell as an administrator, then"
    info "rerun this script. Otherwise, please run this script as root, or install"
    info "sudo."
    exit 1
  fi

  if ! sudo -v; then
    error "Superuser not granted, aborting installation"
    exit 1
  fi
}

get_tmpfile() {
  local suffix
  suffix="$1"
  if has mktemp; then
    printf "%s.%s" "$(mktemp)" "${suffix}"
  else
    printf "/tmp/shempi.%s" "${suffix}"
  fi
}

run_cmd () {
  cmd=$
  $1 && return 0 || rc=$?

  error "Command failed (exit code $rc): ${BLUE}${1}${NO_COLOR}"
  printf "\n" >&2
  exit $rc
}

check_if_arch () {
  if ! has pacman; then
    error'Could not find "pacman", this installer build only for Arch users.'
    exit 1
  fi

  elevate_priv
}

install_paru () {
  if has paru; then
    return 0
  fi

  if ! has makepkg; then
    info $'Could not find "makepkg" command. Let\'s install it!'
    base_devel_install_cmd='sudo pacman -Sy base-devel'
    run_cmd $base_devel_install_cmd
  fi

  info 'Installing Paru...'
  tmp_dir=$(get_tmpfile "dotfiles")
  run_cmd "mkdir --parents ${tmp_dir}"
  run_cmd "cd ${tmp_dir}"
  run_cmd "git clone ${PARU_REPO}"
  run_cmd "cd paru"
  run_cmd "makepkg --syncdeps --install --noconfirm --noprogressbar"
}

install_rust() {
  if has cargo; then
    return 0
  fi

  info 'Installing Rust...'
  run_cmd "sudo pacman --sync --refresh --noconfirm --noprogressbar rustup"
  run_cmd "rustup toolchain install stable"
}

install_packages () {
  info "Installing packages ${REQUIRED_PACKAGES[@]}..."
  cmd="paru --sync --refresh --noconfirm --noprogressbar ${REQUIRED_PACKAGES[@]}"
  run_cmd "$cmd"
}

install_fonts () {
  info "Installing fonts..."
  FONTS_DIR="$HOME/.local/share/fonts"
  cmd="mkdir -p ${FONTS_DIR}"
  run_cmd "$cmd"
  cmd="cp -rf ${SCRIPT_PATH}/fonts/* ${FONTS_DIR}"
  run_cmd "$cmd"
}

install_vim_plug () {
  info 'Installing vim-plug...'
  run_cmd "curl --fail --location --output ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}

copy_configs () {
  run_cmd "mkdir --parents ${HOME}/.config"
  run_cmd "cp --archive ${SCRIPT_PATH}/config/. ${HOME}/.config"
  run_cmd "cp ${SCRIPT_PATH}/.xprofile ${HOME}/.xprofile"
}

install_nvim_plugings () {
   run_cmd "nvim +PlugInstall +qa"
   run_cmd "nvim +CocInstall coc-rust-analyzer coc-git coc-tsserver coc-eslint coc-prettier coc-yaml coc-html coc-sql coc-json coc-sh coc-toml +qa"
}

install_pacman_hooks () {
  run_cmd "sudo mkdir --parents /etc/pacman.d/hooks"
  run_cmd "sudo cp --archive ${SCRIPT_PATH}/hooks/. /etc/pacman.d/hooks"
}

change_shell () {
  run_cmd "chsh -s /bin/fish"
}

check_if_arch
install_rust
install_paru
install_packages
install_fonts
install_vim_plug
copy_configs
install_nvim_plugings
install_pacman_hooks
change_shell
