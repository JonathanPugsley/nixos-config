{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.desktop.hyprpicker.enable {
    home.packages = [ pkgs.hyprpicker ];
  };
}
