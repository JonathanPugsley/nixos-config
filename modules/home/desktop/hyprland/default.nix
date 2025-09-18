{ lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprland.nix
    ./keybinds.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
