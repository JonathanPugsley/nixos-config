{ config, lib, osConfig, ... }: {
  imports = [
    ./nvim/default.nix
    ./libreoffice.nix
    ./librewolf.nix
    ./nixcord.nix
    ./prismlauncher.nix
    ./r2modman.nix
    ./steam.nix
  ];

  options.groups.applications.enable = lib.mkEnableOption "enable applications group";

  config.modules = {
    nixvim.enable = lib.mkDefault config.groups.applications.enable;
    libreoffice.enable = lib.mkDefault config.groups.applications.enable;
    librewolf.enable = lib.mkDefault config.groups.applications.enable;
    nixcord.enable = lib.mkDefault config.groups.applications.enable;
    prismlauncher.enable = lib.mkDefault config.groups.applications.enable;
    r2modman.enable = lib.mkDefault config.groups.applications.enable;
    steam.enable = lib.mkDefault (config.groups.applications.enable && osConfig.modules.steam.enable);
  };
}
