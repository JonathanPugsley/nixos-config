{ config, lib, ... }: {
  config = lib.mkIf config.modules.hardware.qmk.enable {
    hardware.keyboard.qmk.enable = true;
  };
}
