#!/bin/bash

theme=$(ls ~/dotfiles/themes/ | wofi --dmenu -i -p "Select wallpaper:")
python ~/dotfiles/theme_picker.py $theme
