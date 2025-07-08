# Dark-Red Theme

A darker variant of the Catppuccin theme with red accents for all desktop components.

## Overview

This theme provides a much darker color scheme compared to the standard Catppuccin Mocha theme, with a bright red accent color (#ff4444) that creates a striking contrast.

## Color Palette

### Base Colors
- **Crust**: `#000000` (Pure black)
- **Mantle**: `#070707` (Near black)
- **Base**: `#0d0d0d` (Very dark gray)
- **Surface0**: `#1e1e2e` (Dark gray)
- **Surface1**: `#313244` (Medium dark gray)
- **Surface2**: `#45475a` (Medium gray)

### Text Colors
- **Text**: `#e6e9ef` (Bright white)
- **Subtext1**: `#bac2de` (Light gray)
- **Subtext0**: `#a6adc8` (Medium light gray)

### Accent Color
- **Red**: `#ff4444` (Bright red - primary accent)

## Components Included

### 1. Hyprland Window Manager
- **File**: `hyprland/.config/hypr/dark-red.conf`
- **Usage**: Source this file in your hyprland.conf

### 2. Waybar Status Bar
- **Files**: 
  - `waybar/.config/waybar/dark-red.css` (color definitions)
  - `waybar/.config/waybar/dark-red-style.css` (complete theme)
  - `waybar/.config/waybar/dark-red-config.jsonc` (configuration with red accents)

### 3. Wofi Application Launcher
- **File**: `wofi/.config/wofi/dark-red-style.css`
- **Features**: Red borders and selection highlights

### 4. Kitty Terminal
- **File**: `kitty/.config/kitty/dark-red.conf`
- **Features**: Red cursor, tab highlights, and accent colors

### 5. SwayNC Notification Center
- **File**: `swaync/.config/swaync/dark-red-style.css`
- **Features**: Dark notifications with red critical alerts

### 6. Spicetify (Spotify)
- **Directory**: `spicetify/.config/spicetify/Themes/dark-red/`
- **Features**: Complete dark theme with red accent color option

## Installation

### Automatic (Recommended)

Use the provided scripts to switch themes:

```bash
# Switch to dark-red theme
./switch-to-dark-red.sh

# Switch back to catppuccin mocha
./switch-to-mocha.sh
```

### Manual Installation

1. **Hyprland**: Update your `hyprland.conf`:
   ```
   source = ~/.config/hypr/dark-red.conf
   ```

2. **Waybar**: Update your waybar `style.css`:
   ```css
   @import "dark-red.css";
   ```
   Or use the complete `dark-red-style.css`

3. **Kitty**: Copy or symlink the theme:
   ```bash
   cp ~/.config/kitty/dark-red.conf ~/.config/kitty/current_theme.conf
   ```

4. **Spicetify**: Update `config-xpui.ini`:
   ```ini
   current_theme = dark-red
   ```
   Then run: `spicetify apply`

5. **Wofi**: Update your wofi config to use `dark-red-style.css`

6. **SwayNC**: Update your swaync config to use `dark-red-style.css`

## Apply Changes

After installation, restart the relevant services:

```bash
# Reload Hyprland config
hyprctl reload

# Restart Waybar
pkill waybar && waybar &

# Apply Spicetify theme
spicetify apply

# Restart terminal applications for kitty changes
```

## Customization

You can easily customize the accent color by changing the `#ff4444` value in all the theme files to your preferred color. The red accent is used for:

- Active window borders
- Selected items
- Progress bars
- Critical notifications
- Button highlights
- Cursor colors

## Screenshots

The theme provides:
- **Much darker backgrounds** than standard Catppuccin
- **High contrast** with bright text on dark backgrounds
- **Consistent red accents** across all applications
- **Modern dark aesthetic** perfect for low-light environments

## Compatibility

This theme is designed to work with the existing Catppuccin infrastructure and can be easily switched back and forth using the provided scripts.