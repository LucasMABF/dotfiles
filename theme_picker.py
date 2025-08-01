# picks theme

from pathlib import Path
import subprocess
import sys


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
configs = [c.relative_to(theme_folder) for c in theme_folder.iterdir()]

for config in configs:
    if len(sys.argv) == 1:
        confirm = input(f"Change {config}(Y/N):").lower().strip()
        if confirm != "y":
            continue

    path = Path.home() / f"dotfiles/themes/{theme}/{config}"
    for file in path.rglob("*"):
        if file.is_file():
            stow_location = Path.home() / file.relative_to(path)
            try:
                stow_location.unlink()
            except FileNotFoundError:
                continue

    subprocess.run([
        "stow",
        "--no-folding",
        "-d", str(Path.home() / f"dotfiles/themes/{theme}"),
        config,
        "-t", str(Path.home())
    ])


try:
    subprocess.run(["spicetify", "apply"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("spicetify command not found. Spotify not updated.")

try:
    subprocess.run(["hyprctl", "hyprpaper", "reload", ", ",
                   str(Path.home() / ".config/wallpapers" / f"{theme}.png")],
                   stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("hyprctl hyprpaper command not found. Wallpaper not updated.")


try:
    subprocess.run(["hyprctl", "reload"], stdout=subprocess.DEVNULL)
except FileNotFoundError:
    print("hyprctl reload command not found. Hyprland not updated.")


try:
    subprocess.run(["nvima", "--headless", "-c",
                    'lua require("base46").load_all_highlights()',
                    "-c", "qa"])
except FileNotFoundError:
    print("nvim command not found. Neovim not updated.")
