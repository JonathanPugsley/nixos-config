{ lib, ... }: {
  config.hardware.enableRedistributableFirmware = lib.mkDefault true;
}
