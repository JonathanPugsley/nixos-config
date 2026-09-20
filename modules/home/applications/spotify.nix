{ config, lib, pkgs, ... }: {
  options.modules.spotify.enable = lib.mkEnableOption "enable spotify";

  config = lib.mkIf config.modules.spotify.enable {
    home.packages = [ pkgs.spotify ];
  };
}
