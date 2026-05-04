{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/nvidia.nix
    ../../modules/hyprland.nix
  ];

  hardware.nvidia.open = true;

  networking.hostName = "Lucas-Acer";

  users.users.lucas.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFKjEYHudikqGKzwjKppuwx0mDOOzTVXd1w8j8v3f2+z openpgp:0xBCB09B66"
  ];

  system.stateVersion = "25.11";
}
