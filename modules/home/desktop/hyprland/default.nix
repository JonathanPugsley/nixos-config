{ lib, ... }: {
  imports = [
    ./animations.nix
    ./decoration.nix
    ./env.nix
    ./general.nix
    ./input.nix
    ./keybinds.nix
    ./layout.nix
    ./misc.nix
    ./monitor.nix
    ./windowrules.nix
    ./workspacerules.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
