{ config, lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
    ./hyprpolkitagent.nix
    ./hyprsunset.nix
  ];

  options.modules.desktop = {
    cursor.enable = lib.mkEnableOption "cursor";
    hyprlock.enable = lib.mkEnableOption "hyprlock screen locking";
    hyprpaper.enable = lib.mkEnableOption "hyprpaper wallpaper";
    hyprpicker.enable = lib.mkEnableOption "hyprpicker colour picker";
    hyprpolkitagent.enable = lib.mkEnableOption "hyprpolkitagent";
    hyprsunset.enable = lib.mkEnableOption "blue light filter";
  };

  config.modules.desktop = with config.modules; {
    cursor.enable = lib.mkDefault desktop.enable;
    hyprlock.enable = lib.mkDefault desktop.enable;
    hyprpaper.enable = lib.mkDefault desktop.enable;
    hyprpicker.enable = lib.mkDefault desktop.enable;
    hyprpolkitagent.enable = lib.mkDefault desktop.enable;
    hyprsunset.enable = lib.mkDefault desktop.enable;
  };
}
