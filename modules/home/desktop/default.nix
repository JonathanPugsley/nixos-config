{ config, lib, ... }: {
  imports = [
    ./alacritty/default.nix
    ./hyprland/default.nix
    ./mako/default.nix
    ./theming/default.nix
    ./waybar/default.nix
    ./wofi/default.nix
  ];

  options.groups.desktop.enable = lib.mkEnableOption "enable desktop group";

  config.modules = {
    alacritty.enable = lib.mkDefault config.groups.desktop.enable;
    hyprland.enable = lib.mkDefault config.groups.desktop.enable;
    mako.enable = lib.mkDefault config.groups.desktop.enable;
    theming.enable = lib.mkDefault config.groups.desktop.enable;
    waybar.enable = lib.mkDefault config.groups.desktop.enable;
    wofi.enable = lib.mkDefault config.groups.desktop.enable;
  };
}
