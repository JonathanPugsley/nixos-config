{ lib, ... }: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./config.nix
    ./env.nix
    ./layout.nix
    ./misc.nix
    ./monitors.nix
    ./rules.nix
  ];

  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";
}
