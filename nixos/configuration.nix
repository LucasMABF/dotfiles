{ config, lib, pkgs, ... }:

{
  imports = [/etc/nixos/hardware-configuration.nix];

  nix.settings.experimental-features = "nix-command flakes";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Lucas-Acer";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  i18n.defaultLocale = "C.UTF-8";
  console.useXkbConfig = true;
  services.xserver = {
    xkb.layout = "br";
  };

  time.timeZone = "America/Sao_Paulo";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  hardware.alsa.enablePersistence = true;

  programs.zsh.enable = true;

  users.users.lucas = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  
  services.greetd = {
    enable = true;

    settings = {
      terminal.vt = 1;

      default_session.command = "${pkgs.greetd}/bin/agreety --cmd /bin/sh";

      initial_session = {
        command = "uwsm start hyprland-uwsm.desktop";
        user = "lucas";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git
    gnupg
    neovim
    python3
    kanata
  ];

  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };

  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';

  boot.kernelModules = ["uinput"];

  users.users.kanata = {
    isSystemUser = true;
    group = "kanata";
  };

  users.groups.kanata = {};

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="kanata"
    SUBSYSTEM=="input", KERNEL=="event*", MODE="0660", GROUP="kanata"
  '';

  systemd.services.kanata = {
    description = "Kanata keyboard remapper";
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      ExecStart = "${pkgs.kanata}/bin/kanata -c /etc/kanata/kanata.kbd";

      User = "kanata";
      Group = "kanata";

      Restart = "always";

      ReadOnlyPaths = "/etc/kanata";

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
    };

  };


  system.stateVersion = "25.11";
}
