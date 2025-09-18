{ config, lib, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable applications";

  config.modules = {
    spotify.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault config.groups.applications.enable;
  };
}
