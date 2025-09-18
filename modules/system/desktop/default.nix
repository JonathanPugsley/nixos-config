{ config, lib, ... }: {
  imports = [
    ./bluetooth.nix
    ./hyprland.nix
    ./ly.nix
  ];

  options.groups.desktop.enable = lib.mkEnableOption "enable desktop";

  config.modules = {
    bluetooth.enable = lib.mkDefault config.groups.desktop.enable;
    hyprland.enable = lib.mkDefault config.groups.desktop.enable;
    ly.enable = lib.mkDefault config.groups.desktop.enable;
  };
}
