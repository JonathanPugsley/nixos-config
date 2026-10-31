{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    home.packages = [ pkgs.tree ];
  };
}
