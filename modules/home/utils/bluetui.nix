{ config, lib, pkgs, ...}: {
  config = lib.mkIf config.modules.utils.bluetui.enable {
    home.packages = [ pkgs.bluetui ];
  };
}
