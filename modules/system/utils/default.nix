{ config, lib, ... }: {
  imports = [
    ./brightnessctl.nix
    ./cifs-utils.nix
  ];

  options.groups.utils.enable = lib.mkEnableOption "enable utils";

  config.modules = {
    brightnessctl.enable = lib.mkDefault config.groups.utils.enable;
    cifs.enable = lib.mkDefault config.groups.utils.enable;
  };
}
