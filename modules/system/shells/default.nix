{ config, lib, ... }: {
  imports = [
    ./zsh.nix
  ];

  options.groups.shells.enable = lib.mkEnableOption "enable shells";

  config.modules = {
    zsh.enable = lib.mkDefault config.groups.shells.enable;
  };
}
