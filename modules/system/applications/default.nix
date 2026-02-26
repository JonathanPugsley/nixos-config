{ config, lib, ... }: {
  imports = [
    ./gamemode.nix
    ./qmk.nix
    ./steam.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable system applications group";

  config.modules = {
    gamemode.enable = lib.mkDefault config.groups.applications.enable;
    qmk.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault config.groups.applications.enable;
  };
}
