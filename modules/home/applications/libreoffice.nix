{ config, lib, pkgs, ... }: {
  options.modules.libreoffice.enable = lib.mkEnableOption "enable libreoffice";

  config = lib.mkIf config.modules.libreoffice.enable {
    home.packages = [ pkgs.libreoffice-qt ];
  };
}
