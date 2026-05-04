{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      size = 1000;
      save = 1000;
    };

    oh-my-zsh.enable = true;

    initContent = ''
      bindkey -v
      bindkey '^j' autosuggest-accept
    '';
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
    enableZshIntegration = true;
  };

  programs.starship.enable = true;
}
