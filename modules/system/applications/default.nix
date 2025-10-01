{ config, lib, ... }: {
  imports = [
    ./gamemode.nix
    ./spotify.nix
    ./steam.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable applications";

  config.modules = {
    gamemode.enable = lib.mkDefault config.groups.applications.enable;
    spotify.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault config.groups.applications.enable;
  };
}
