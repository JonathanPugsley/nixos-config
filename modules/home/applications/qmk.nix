{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.applications.qmk.enable {
    home.packages = [ pkgs.qmk ];
  };
}
