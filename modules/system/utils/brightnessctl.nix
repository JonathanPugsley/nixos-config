{ config, lib, pkgs, ... }: {
  options.modules.brightnessctl.enable = lib.mkEnableOption "enable brightnessctl";

  config = lib.mkIf config.modules.brightnessctl.enable {
    environment.systemPackages = [ pkgs.brightnessctl ];
  };
}
