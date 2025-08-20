{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.libreoffice-qt ];
}
