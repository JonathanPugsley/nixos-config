{ config, lib, pkgs, ... }: {
  options.modules.ncdu.enable = lib.mkEnableOption "enable ncdu";

  config = lib.mkIf config.modules.ncdu.enable {
    home.packages = [ pkgs.ncdu ];
  };
}
