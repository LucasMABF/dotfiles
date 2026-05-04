{ ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/env.nix
    ./modules/git.nix
    ./modules/gpg.nix
    ./modules/packages.nix
  ];

  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
