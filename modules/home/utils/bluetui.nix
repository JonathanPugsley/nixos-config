{ config, lib, pkgs, ...}: {
  options.modules.bluetui.enable = lib.mkEnableOption "enable bluetui";

  config = lib.mkIf config.modules.bluetui.enable {
    home.packages = [ pkgs.bluetui ];
  };
}
