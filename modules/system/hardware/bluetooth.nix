{ config, lib, ...}: {
  config = lib.mkIf config.modules.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = config.modules.hardware.bluetooth.powerOnBoot;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # show device battery charge
      };
    };
  };
}
