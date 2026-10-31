{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.applications.davinci.enable {
    home.packages = [ pkgs.davinci-resolve ];
  };
}
