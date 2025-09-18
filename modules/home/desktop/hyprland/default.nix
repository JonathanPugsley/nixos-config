{ lib, ... }: {
  imports = [
    ./cursor.nix
    ./hyprland.nix
    ./keybinds.nix
  ];

  config.modules.hyprland.enable = lib.mkDefault true;

}
