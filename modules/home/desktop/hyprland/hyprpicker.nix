{ config, lib, pkgs, ... }: {
  config.home = lib.mkIf config.modules.hyprland.enable {
    packages = [ pkgs.hyprpicker ];
  };
}
