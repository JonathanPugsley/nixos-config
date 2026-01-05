{ config, lib, pkgs, ... }: {
  options.modules.r2modman.enable = lib.mkEnableOption "enable r2modman";

  config = lib.mkIf config.modules.r2modman.enable {
    home.packages = [ pkgs.r2modman ];
  };
}
