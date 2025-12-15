{ config, lib, ... }: {
  imports = [
    ./bluetooth.nix
    ./hyprland.nix
    ./ly.nix
    ./nvidia.nix
    ./stylix.nix
  ];

  options.groups.desktop.enable = lib.mkEnableOption "enable desktop group";

  config.modules = {
    bluetooth.enable = lib.mkDefault config.groups.desktop.enable;
    hyprland.enable = lib.mkDefault config.groups.desktop.enable;
    ly.enable = lib.mkDefault config.groups.desktop.enable;
    nvidia.enable = lib.mkDefault config.groups.desktop.enable;
    stylix.enable = lib.mkDefault config.groups.desktop.enable;
  };
}
