#!/bin/bash

theme=$(ls ~/dotfiles/themes/ | rofi -dmenu -i -p "Select wallpaper:")
python ~/dotfiles/theme_picker.py $theme
