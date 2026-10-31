{ config, lib, ... }: {
  imports = [
    ./hypr-ecosystem/default.nix
    ./hyprland/default.nix
    ./rofi/default.nix
    ./waybar/default.nix

    ./alacritty.nix
    ./mako.nix
    ./wl-clipboard.nix
    ./xdg.nix
  ];

  options.modules.desktop = {
    enable = lib.mkEnableOption "enable desktop group";

    alacritty.enable = lib.mkEnableOption "alacritty terminal emulator";
    hypr-ecosystem.enable = lib.mkEnableOption "hypr-ecosystem";
    hyprland.enable = lib.mkEnableOption "hyprland wayland compositor and WM";
    mako.enable = lib.mkEnableOption "mako notificaiton daemon";
    rofi.enable = lib.mkEnableOption "rofi dynamic menu";
    waybar.enable = lib.mkEnableOption "waybar";
    wl-clipboard.enable = lib.mkEnableOption "wl-clipboard";
    xdg.enable = lib.mkEnableOption "xdg";
  };

  config.modules.desktop = with config.modules; {
    alacritty.enable = lib.mkDefault desktop.enable;
    hypr-ecosystem.enable = lib.mkDefault desktop.enable;
    hyprland.enable = lib.mkDefault desktop.enable;
    mako.enable = lib.mkDefault desktop.enable;
    rofi.enable = lib.mkDefault desktop.enable;
    waybar.enable = lib.mkDefault desktop.enable;
    wl-clipboard.enable = lib.mkDefault desktop.enable;
    xdg.enable = lib.mkDefault desktop.enable;
  };
}
