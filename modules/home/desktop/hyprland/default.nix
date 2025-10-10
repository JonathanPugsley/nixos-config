{ lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
    ./hyprshot.nix
    ./hyprsunset.nix
    ./keybinds.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
