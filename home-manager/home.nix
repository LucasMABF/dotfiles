{ config, pkgs, ... }:
let 
  catppuccin-gtk-theme = pkgs.catppuccin-gtk.override {
    accents = [ "sapphire" ];
    variant = "mocha";
  };
  tokyonight-gtk-theme = pkgs.tokyonight-gtk-theme.override {
    iconVariants = [ "Moon" ];
  };
  colloid-gtk-theme = pkgs.colloid-gtk-theme.override {
    colorVariants = ["dark"];
    tweaks = ["nord"];
  };
in {
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 1000;
      save = 1000;
      path = "$HOME/.histfile";
    };

    oh-my-zsh.enable = true;

    initContent = ''
      bindkey -v
      bindkey '^j' autosuggest-accept
    '';
  };

  programs.git = let
    identityPath = "${builtins.getEnv "HOME"}/dotfiles/home-manager/git_identity.nix";

    identity = if builtins.pathExists identityPath
               then import identityPath
               else {name = ""; email = ""; gpgKey = "";};
  in {
    enable = true;

    settings = {
      user.name = identity.name;
      user.email = identity.email;

      commit.gpgsign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      init.defaultBranch = "main";
      credential.helper = "gh";
    };

    signing = {
      key = identity.gpgKey;
      signByDefault = true;
    };
  };

  programs.gh.enable = true;

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
    enableZshIntegration = true;
  };

  programs.starship.enable = true;

  home.packages = with pkgs; [
    awww
    btop
    catppuccin-cursors
    catppuccin-gtk-theme
    cava
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
    nordzy-cursor-theme
    papirus-icon-theme
    pavucontrol
    power-profiles-daemon
    ripgrep
    nwg-look
    spicetify-cli
    spotify
    stow
    tokyonight-gtk-theme
    swaynotificationcenter
    waybar
    wl-clipboard
    wttrbar
    zathura
    (rofi.override {
      plugins = [rofi-nerdy];
    })
  ];

  home.file = {
    ".local/share/icons/catppuccin-mocha-dark-cursors".source =
      "${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors";
    ".local/share/themes/catppuccin-mocha-sapphire-standard+default".source =
      "${catppuccin-gtk-theme}/share/themes/catppuccin-mocha-sapphire-standard";
    ".local/share/themes/Tokyonight-Dark".source =
      "${tokyonight-gtk-theme}/share/themes/Tokyonight-Dark";
    ".local/share/icons/Papirus".source =
      "${pkgs.papirus-icon-theme}/share/icons/Papirus";
    ".local/share/icons/Tokyonight-Moon".source =
      "${tokyonight-gtk-theme}/share/icons/Tokyonight-Moon";
    ".local/share/themes/Colloid-Dark-Nord".source =
      "${colloid-gtk-theme}/share/themes/Colloid-Dark-Nord";
    ".local/share/icons/Nordzy-cursors".source = 
      "${pkgs.nordzy-cursor-theme}/share/icons/Nordzy-cursors";
    ".local/share/icons/Nordzy-hyprcursors".source =
      "${pkgs.nordzy-cursor-theme}/share/icons/Nordzy-hyprcursors";

    # AdwaitaModified
    # nord-arc
    # https://github.com/RobVe4/NordArc
  };

  # home.sessionPath = ["$HOME/.cargo/bin"];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    PAGER = "less -F -X";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
