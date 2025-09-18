{ config, lib, pkgs, inputs, ... }: {
  options.modules.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config.programs.hyprland = lib.mkIf config.modules.hyprland.enable {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
