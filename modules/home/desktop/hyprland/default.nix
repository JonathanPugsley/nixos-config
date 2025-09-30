{ lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./keybinds.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
