{ config, lib, ... }: {
  imports = [
    ./brightnessctl.nix
    ./cifs-utils.nix
    ./udisks.nix
  ];

  options.groups.utils.enable = lib.mkEnableOption "enable system utils group";

  config.modules = {
    brightnessctl.enable = lib.mkDefault config.groups.utils.enable;
    cifs.enable = lib.mkDefault config.groups.utils.enable;
    udisks.enable = lib.mkDefault config.groups.utils.enable;
  };
}
