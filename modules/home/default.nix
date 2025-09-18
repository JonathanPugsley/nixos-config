{ config, lib, ... }: {
  imports = [
    ./applications/default.nix
    ./desktop/default.nix
    ./misc/default.nix
    ./utils/default.nix
  ];

  options.groups.home.enable = lib.mkEnableOption "enable home group";

  config.groups = {
    applications.enable = lib.mkDefault config.groups.home.enable;
    desktop.enable = lib.mkDefault config.groups.home.enable;
    misc.enable = lib.mkDefault config.groups.home.enable;
    utils.enable = lib.mkDefault config.groups.home.enable;
  };

}
