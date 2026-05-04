{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Lucas Mendes";
        email = "70616909+LucasMABF@users.noreply.github.com";
      };

      init.defaultBranch = "main";
      credential.helper = "gh";
    };

    signing = {
      format = "openpgp";
      signByDefault = true;
    };
  };

  programs.gh.enable = true;
}
