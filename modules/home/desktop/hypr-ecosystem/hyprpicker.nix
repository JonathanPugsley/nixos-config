{ config, lib, pkgs, ... }: {
  options.modules.hyprpicker.enable = lib.mkEnableOption "enable hyprpicker";

  config = lib.mkIf config.modules.hyprpicker.enable {
    home.packages = [ pkgs.hyprpicker ];
  };
}
