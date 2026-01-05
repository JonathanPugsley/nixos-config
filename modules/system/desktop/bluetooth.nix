{ config, lib, ...}: {
  options.modules.bluetooth.enable = lib.mkEnableOption "enable bluetooth";
  options.modules.bluetooth.powerOnBoot.enable = lib.mkEnableOption "enable powerOnBoot for bluetooth";

  config = lib.mkIf config.modules.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = config.modules.bluetooth.powerOnBoot.enable;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # show device battery charge
      };
    };
  };
}
