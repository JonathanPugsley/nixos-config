{ config, lib, pkgs, ... }: {
  options.modules.playerctl.enable = lib.mkEnableOption "enable playerctl";

  config = lib.mkIf config.modules.playerctl.enable {
    home.packages = [ pkgs.playerctl ];
  };
}
