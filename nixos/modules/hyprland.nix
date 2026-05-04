{ pkgs, ... }:

{
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
}
