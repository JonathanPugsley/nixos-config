{ config, lib, pkgs, ... }: {
  options.modules.spotify.enable = lib.mkEnableOption "enable spotify";

  config = lib.mkIf config.modules.spotify.enable {
    environment.systemPackages = [ pkgs.spotify ];
  };
}
