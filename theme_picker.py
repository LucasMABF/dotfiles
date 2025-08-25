# picks theme

from pathlib import Path
import subprocess
import sys
import os


if len(sys.argv) > 1:
    theme = sys.argv[1]
else:
    print("Themes:\n")
    themes_folder = Path.home() / "dotfiles/themes"
    themes = [f.relative_to(themes_folder) for f in themes_folder.iterdir()]

    for i, theme in enumerate(themes):
        print(f"{i}: {theme}")

    theme_option = int(input("\nChoose a theme: "))

    if theme_option >= len(themes) or theme_option < 0:
        print("Invalid option. Exiting.")
        sys.exit(1)

    theme = themes[theme_option]

theme_folder = Path.home() / f"dotfiles/themes/{theme}/"
configs = [c.relative_to(theme_folder) for c in theme_folder.iterdir()
           if c.is_dir()]

for config in configs:
    if len(sys.argv) == 1:
        confirm = input(f"Change {config}(Y/N):").lower().strip()
        if confirm != "y":
            continue

    path = Path.home() / f"dotfiles/themes/{theme}/{config}"
    for file in path.rglob("*"):
        if file.is_file():
            stow_location = Path.home() / file.relative_to(path)
            subprocess.run(["ln", "-sfn", file, stow_location])


try:
    with open(theme_folder / "wallpaper.txt") as f:
        wallpaper = f.readline().strip()
    subprocess.run(["swww", "img", "--transition-type", "any",
                   str(Path.home() / "dotfiles/wallpapers" / f"{wallpaper}")],
                   stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("swww command not found. Wallpaper not updated.")

try:
    subprocess.run(["pkill", "waybar"], stdout=subprocess.DEVNULL)
    subprocess.Popen(["waybar"], stdout=subprocess.DEVNULL, env=os.environ)
except FileNotFoundError:
    print("waybar command not found. Waybar not updated.")

try:
    subprocess.run(["hyprctl", "reload"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("hyprctl reload command not found. Hyprland not updated.")

try:
    env_file = Path.home() / ".config/uwsm/env-theme"
    cursor_settings = []
    with open(env_file) as f:
        for line in f:
            key_value = line.strip().split(" ", 1)[1]
            key, value = key_value.split("=", 1)
            cursor_settings.append(value.strip())

    subprocess.run(["hyprctl", "setcursor", cursor_settings[0],
                    cursor_settings[1]], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("hyprctl setcursor command not found. Cursor not updated.")

try:
    subprocess.run(["nwg-look", "-a", "-x"], stdout=subprocess.DEVNULL)
    subprocess.run(["pkill", "nautilus"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("nwg-look command not found. GTK not updated.")

try:
    subprocess.run(["pkill", "swaync"], stdout=subprocess.DEVNULL)
    subprocess.Popen(["swaync"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("swaync command not found. Swaync not updated.")

try:
    subprocess.run(["spicetify", "apply"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("spicetify command not found. Spotify not updated.")

try:
    subprocess.run(["nvim", "--headless", "-c",
                    'lua require("base46").load_all_highlights()',
                    "-c", "qa"])
except FileNotFoundError:
    print("nvim command not found. Neovim not updated.")
