{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.utils.brightnessctl.enable {
    environment.systemPackages = [ pkgs.brightnessctl ];
  };
}
