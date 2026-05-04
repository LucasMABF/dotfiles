{ ... }:

{
  services.kanata = {
    enable = true;
    keyboards.default = {
      configFile = ../../kanata/kanata.kbd;
    };
  };
}
