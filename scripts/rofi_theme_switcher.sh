#!/usr/bin/env bash

theme=$(find "$HOME/dotfiles/themes/" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | rofi -dmenu -i -p "Select theme:" 2>/dev/null )

if [ -n "$theme" ]; then
  python ~/dotfiles/scripts/theme_picker.py $theme
fi
