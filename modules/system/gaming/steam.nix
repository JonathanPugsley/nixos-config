{ config, lib, ... }: {
  config = lib.mkIf config.modules.gaming.steam.enable {
    hardware.graphics.enable32Bit = true;
  };
}
