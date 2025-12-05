{ config, lib, ...}: {
  options.modules.bluetooth.enable = lib.mkEnableOption "enable bluetooth";

  config = lib.mkIf config.modules.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true; # show devices' battery charge
      };
    };
  };
}
