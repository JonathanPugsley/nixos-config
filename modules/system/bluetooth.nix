{ config, ...}: {
  config.hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true; # Show battery charge of devices
    };
  };
}
