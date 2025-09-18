{ config, lib, ... }: {
  options.modules.steam.enable = lib.mkEnableOption "enable steam";

  config = lib.mkIf config.modules.steam.enable {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
