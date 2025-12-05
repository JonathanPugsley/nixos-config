{ config, lib, ... }: {
  imports = [
    ./zsh/default.nix
  ];

  options.groups.shells.enable = lib.mkEnableOption "enable shells group";

  config.modules = {
    zsh.enable = lib.mkDefault config.groups.shells.enable;
  };
}
