{ lib, ... }: {
  imports = [
    ./hyprland.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
