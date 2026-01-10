{ config, lib, osConfig, ... }: {
  imports = [
    ./bash/default.nix
    ./zsh/default.nix
  ];

  options.groups.shells.enable = lib.mkEnableOption "enable home shells group";

  config.modules = {
    bash.enable = lib.mkDefault (config.groups.shells.enable && osConfig.modules.zsh.enable);
    zsh.enable = lib.mkDefault (config.groups.shells.enable && osConfig.modules.zsh.enable);
  };
}
