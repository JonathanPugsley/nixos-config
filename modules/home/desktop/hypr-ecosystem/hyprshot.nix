{ config, lib, pkgs, ... }: {
  options.modules.hyprshot.enable = lib.mkEnableOption "enable hyprshot";

  config = lib.mkIf config.modules.hyprshot.enable {
    home.packages = [ pkgs.hyprshot ];
  };
}
