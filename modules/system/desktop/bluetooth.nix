{ config, lib, ...}: {
  options.modules.bluetooth.enable = lib.mkEnableOption "enable bluetooth";

  config.hardware.bluetooth = lib.mkIf config.modules.bluetooth.enable {
    enable = true;
    powerOnBoot = false;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true; # Show battery charge of devices
    };
  };
}
