{ config, lib, ... }: {
  imports = [
    ./bluetooth.nix
    ./hyprland.nix
    ./ly.nix
    ./stylix.nix
  ];

  options.groups.desktop.enable = lib.mkEnableOption "enable system desktop group";

  config.modules = {
    bluetooth = {
      enable = lib.mkDefault config.groups.desktop.enable;
      powerOnBoot.enable = lib.mkDefault config.modules.bluetooth.enable;
    };
    hyprland.enable = lib.mkDefault config.groups.desktop.enable;
    ly.enable = lib.mkDefault config.groups.desktop.enable;
    stylix.enable = lib.mkDefault config.groups.desktop.enable;
  };
}
