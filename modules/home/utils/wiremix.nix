{ config, lib, pkgs, ... }: {
  options.modules.wiremix.enable = lib.mkEnableOption "enable wiremix TUI";

  config = lib.mkIf config.modules.wiremix.enable {
    home.packages = [ pkgs.wiremix ];
  };
}
