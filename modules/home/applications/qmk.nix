{ config, lib, pkgs, ... }: {
  options.modules.qmk.enable = lib.mkEnableOption "enable qmk";

  config = lib.mkIf config.modules.qmk.enable {
    home.packages = [ pkgs.qmk ];
  };
}
