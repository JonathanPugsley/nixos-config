{ config, lib, ... }: {
  imports = [
    ./brightnessctl.nix
    ./cifs-utils.nix
    ./udisks.nix
  ];

  options.modules.utils = {
    enable = lib.mkEnableOption "system utilities";

    brightnessctl.enable = lib.mkEnableOption "screen brightness control";
    cifs.enable = lib.mkEnableOption "cifs";
    udisks.enable = lib.mkEnableOption "udisks";
  };

  config.modules.utils = with config.modules; {
    brightnessctl.enable = lib.mkDefault utils.enable;
    cifs.enable = lib.mkDefault utils.enable;
    udisks.enable = lib.mkDefault utils.enable;
  };
}
