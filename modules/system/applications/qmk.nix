{ config, lib, ... }: {
  options.modules.qmk.enable = lib.mkEnableOption "enable qmk";

  config = lib.mkIf config.modules.qmk.enable {
    hardware.keyboard.qmk.enable = true;
  };
}
