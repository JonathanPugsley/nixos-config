{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.hypr-ecosystem.enable {
    home.packages = [ pkgs.hyprpicker ];
  };
}
