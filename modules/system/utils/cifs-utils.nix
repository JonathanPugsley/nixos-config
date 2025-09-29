{ config, lib, pkgs, ... }: {
  options.modules.cifs.enable = lib.mkEnableOption "enable cifs-utils";

  config = lib.mkIf config.modules.cifs.enable {
    environment.systemPackages = [ pkgs.cifs-utils ];
  };
}
