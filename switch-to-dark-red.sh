#!/bin/bash

# Script to switch to dark-red theme across all desktop components

echo "🎨 Switching to Dark-Red theme..."

# Update Hyprland config
echo "🔄 Updating Hyprland configuration..."
sed -i 's/source = ~/.config/hypr/mocha.conf/source = ~/.config/hypr/dark-red.conf/' ~/.config/hypr/hyprland.conf

# Update Waybar style
echo "🔄 Updating Waybar configuration..."
sed -i 's/@import "mocha.css";/@import "dark-red.css";/' ~/.config/waybar/style.css

# Update Kitty theme
echo "🔄 Updating Kitty configuration..."
if [ -f ~/.config/kitty/current_theme.conf ]; then
    cp ~/.config/kitty/dark-red.conf ~/.config/kitty/current_theme.conf
fi

# Update Spicetify config
echo "🔄 Updating Spicetify configuration..."
if [ -f ~/.config/spicetify/config-xpui.ini ]; then
    sed -i 's/current_theme          = catppuccin/current_theme          = dark-red/' ~/.config/spicetify/config-xpui.ini
fi

# Update Wofi style (you may need to manually change the config to use dark-red-style.css)
echo "📝 Note: You may need to manually update Wofi configuration to use dark-red-style.css"

# Update SwayNC style (you may need to manually change the config to use dark-red-style.css)
echo "📝 Note: You may need to manually update SwayNC configuration to use dark-red-style.css"

echo "✅ Theme switch complete! You may need to:"
echo "   - Restart Waybar: pkill waybar && waybar &"
echo "   - Reload Hyprland config: hyprctl reload"
echo "   - Apply Spicetify theme: spicetify apply"
echo "   - Restart terminal applications to see changes"

echo "🎉 Dark-Red theme activated!"