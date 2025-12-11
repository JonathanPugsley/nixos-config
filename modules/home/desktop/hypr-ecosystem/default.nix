{ lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
    ./hyprshot.nix
    ./hyprsunset.nix
  ];

  options.modules.hypr-ecosystem.enable = lib.mkEnableOption "enable the hyprland ecosystem";
}
