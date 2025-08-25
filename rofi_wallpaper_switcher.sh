#!/bin/bash

wallpaper=$(find "$HOME/dotfiles/wallpapers/" -maxdepth 1 -type f -printf "%f\n" | rofi -dmenu -i -p "Select wallpaper:" 2>/dev/null)

if [ -n "$wallpaper" ]; then
  swww img --transition-type any "$HOME/dotfiles/wallpapers/$wallpaper"
fi
