{ config, lib, pkgs, ... }: {
  options.modules.steam.enable = lib.mkEnableOption "enable steam";

  config = lib.mkIf config.modules.steam.enable {
    home.packages = [ pkgs.steam ];
  };
}
