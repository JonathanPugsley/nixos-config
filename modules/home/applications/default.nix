{ config, lib, ... }: {
  imports = [
    ./nvim/default.nix

    ./libreoffice.nix
    ./librewolf.nix
    ./nixcord.nix
    ./steam.nix
    ./vscodium.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable applications group";

  config.modules = {
    nixvim.enable = lib.mkDefault config.groups.applications.enable;

    libreoffice.enable = lib.mkDefault config.groups.applications.enable;
    librewolf.enable = lib.mkDefault config.groups.applications.enable;
    nixcord.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault config.groups.applications.enable;
    vscodium.enable = lib.mkDefault config.groups.applications.enable;
  };
}
