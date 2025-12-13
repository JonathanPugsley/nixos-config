{ config, lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
    ./hyprshot.nix
    ./hyprsunset.nix
  ];

  options.modules.hypr-ecosystem.enable = lib.mkEnableOption "enable hyprland ecosystem programs and services";

  config.modules = {
    cursor.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
    hyprlock.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
    hyprpaper.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
    hyprpicker.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
    hyprshot.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
    hyprsunset.enable = lib.mkDefault config.modules.hypr-ecosystem.enable;
  };
}
