{ config, lib, ... }: {
  imports = [
    ./gamemode.nix
    ./steam.nix
  ];

  options.modules.gaming = {
    enable = lib.mkEnableOption "gaming capabilities";

    gamemode.enable = lib.mkEnableOption "enable gamemode";
    steam.enable = lib.mkEnableOption "enable steam";
  };

  config.modules.gaming = with config.modules; {
    gamemode.enable = lib.mkDefault gaming.enable;
    steam.enable = lib.mkDefault gaming.enable;
  };
}
