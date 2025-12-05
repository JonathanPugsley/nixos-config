{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = [ pkgs.hyprpicker ];
  };
}
