{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.applications.spotify.enable {
    home.packages = [ pkgs.spotify ];
  };
}
