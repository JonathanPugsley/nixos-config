{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.gaming.steam.enable {
    home.packages = [ pkgs.steam ];
  };
}
