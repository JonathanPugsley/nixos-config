{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.audio.enable {
    home.packages = [ pkgs.qpwgraph ];
  };
}
