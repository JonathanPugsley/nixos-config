{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.applications.libreoffice.enable {
    home.packages = [ pkgs.libreoffice-qt ];
  };
}
