{ config, lib, osConfig, ... }: {
  imports = [
    ./alacritty/default.nix
    ./hypr-ecosystem/default.nix
    ./hyprland/default.nix
    ./mako/default.nix
    ./rofi/default.nix
    ./waybar/default.nix
    ./wl-clipboard/default.nix
    ./xdg/default.nix
  ];

  options.groups.desktop.enable = lib.mkEnableOption "enable desktop group";

  config.modules = {
    alacritty.enable = lib.mkDefault config.groups.desktop.enable;
    hypr-ecosystem.enable = lib.mkDefault (config.groups.desktop.enable && osConfig.modules.hyprland.enable);
    hyprland.enable = lib.mkDefault (config.groups.desktop.enable && osConfig.modules.hyprland.enable);
    mako.enable = lib.mkDefault config.groups.desktop.enable;
    rofi.enable = lib.mkDefault config.groups.desktop.enable;
    waybar.enable = lib.mkDefault config.groups.desktop.enable;
    wl-clipboard.enable = lib.mkDefault config.groups.desktop.enable;
    xdg.enable = lib.mkDefault config.groups.desktop.enable;
  };
}
