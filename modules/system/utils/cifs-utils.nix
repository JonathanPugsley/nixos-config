{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.utils.cifs.enable {
    environment.systemPackages = [ pkgs.cifs-utils ];
  };
}
