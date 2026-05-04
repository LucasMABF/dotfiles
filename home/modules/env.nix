{ ... }:

{
  xdg.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    PAGER = "less -F -X";
  };
}
