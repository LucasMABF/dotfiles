{ pkgs, host, ... }:
let
  sshKey = {
    acer = "3CE1264E1B7A743CD7893B6ABC8C0866D83362B3";
    dell = "E156CC310D9852C491522F85F326CD9C6334FB78";
  };
in
{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
    sshKeys = [ sshKey.${host.name} ];
  };
}
