{ ... }:

{
  services.kanata = {
    enable = true;
    keyboards.default = {
      configFile = /etc/kanata/kanata.kbd;
    };
  };
}
