{ config, lib, ... }: {
  imports = [
    ./libreoffice.nix
    ./librewolf.nix
    ./nixcord.nix
    ./steam.nix
    ./vscodium.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable applications group";

  config.modules = {
    libreoffice.enable = lib.mkDefault config.groups.applications.enable;
    librewolf.enable = lib.mkDefault config.groups.applications.enable;
    nixcord.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault config.groups.applications.enable;
    vscodium.enable = lib.mkDefault config.groups.applications.enable;
  };
}
