{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.gaming.r2modman.enable {
    home.packages = [ pkgs.r2modman ];
  };
}
