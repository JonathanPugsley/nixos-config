{ config, lib, ... }: {
  imports = [
    ./playerctl.nix
  ];

  options.groups.misc.enable = lib.mkEnableOption "enable misc group";

  config.modules = {
    playerctl.enable = lib.mkDefault config.groups.misc.enable;
  };
}
