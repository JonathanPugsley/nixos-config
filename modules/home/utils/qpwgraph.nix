{ config, lib, pkgs, ... }: {
  options.modules.qpwgraph.enable = lib.mkEnableOption "enable qpwgraph";

  config = lib.mkIf config.modules.qpwgraph.enable {
    home.packages = [ pkgs.qpwgraph ];
  };
}
