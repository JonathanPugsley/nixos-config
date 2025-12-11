{ lib, ... }: {
  imports = [
    ./animations.nix
    ./decoration.nix
    ./env.nix
    ./hyprland.nix
    ./input.nix
    ./keybinds.nix
    ./windowrules.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
