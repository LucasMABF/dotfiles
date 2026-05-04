#!/usr/bin/env bash
. /etc/os-release
case "$ID" in
  nixos)
    ln -s $HOME/dotfiles/scripts/rofi_distros/nixos.rasi $HOME/.config/rofi/distro.rasi
    echo "" ;;
  arch)
    ln -s $HOME/dotfiles/scripts/rofi_distros/arch.rasi $HOME/.config/rofi/distro.rasi
    echo "󰣇" ;;
  *)
    ln -s $HOME/dotfiles/scripts/rofi_distros/default.rasi $HOME/.config/rofi/distro.rasi
    echo '' ;;
esac
