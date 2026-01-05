{ config, lib, ... }: {
  imports = [
    ./zsh.nix
  ];

  options.groups.shells.enable = lib.mkEnableOption "enable system shells group";

  config.modules = {
    zsh.enable = lib.mkDefault config.groups.shells.enable;
  };
}
