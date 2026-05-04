{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/nvidia.nix
    ../../modules/hyprland.nix
    ../../modules/kanata.nix
  ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
  hardware.nvidia.open = false;

  networking.hostName = "Lucas-Dell";

  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';

  users.users.lucas.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyhsPfDH0MDy653iJX5rd2IGg62e5UlLQlm1UkCVi44 openpgp:0x5D521F88"
  ];

  system.stateVersion = "25.11";
}
