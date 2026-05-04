{ pkgs, ... }:
let
  catppuccin-gtk-theme = pkgs.catppuccin-gtk.override {
    accents = [ "sapphire" ];
    variant = "mocha";
  };
  tokyonight-gtk-theme = pkgs.tokyonight-gtk-theme.override {
    iconVariants = [ "Moon" ];
  };
  colloid-gtk-theme = pkgs.colloid-gtk-theme.override {
    colorVariants = [ "dark" ];
    tweaks = [ "nord" ];
  };
  nord-arc = pkgs.callPackage ../pkgs/nord-arc.nix { };
  adwaita-modified = pkgs.callPackage ../pkgs/adwaita-modified.nix { };
in
{
  home.packages = with pkgs; [
    adwaita-modified
    awww
    btop
    catppuccin-cursors
    catppuccin-gtk-theme
    cava
    claude-code
    cliphist
    colloid-gtk-theme
    fastfetch
    firefox
    font-awesome
    hypridle
    hyprlock
    hyprshot
    kitty
    nautilus
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.recursive-mono
    networkmanagerapplet
    nixd
    nixfmt
    nord-arc
    nordzy-cursor-theme
    nwg-look
    papirus-icon-theme
    pavucontrol
    python3
    ripgrep
    spicetify-cli
    spotify
    stow
    swaynotificationcenter
    tokyonight-gtk-theme
    waybar
    wl-clipboard
    wttrbar
    zathura
    (rofi.override {
      plugins = [ rofi-nerdy ];
    })
  ];
}
