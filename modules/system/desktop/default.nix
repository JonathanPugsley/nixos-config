{ config, lib, ... }: {
  imports = [
    ./hyprland.nix
    ./ly.nix
    ./options.nix
  ];

  options.modules.desktop = {
    enable = lib.mkEnableOption "desktop environment";

    hyprland.enable = lib.mkEnableOption "hyprland wayland compositor and WM";
    ly.enable = lib.mkEnableOption "ly display manager";
  };

  config.modules.desktop = with config.modules; {
    hyprland.enable = lib.mkDefault desktop.enable;
    ly.enable = lib.mkDefault desktop.enable;
  };
}
