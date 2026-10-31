{ config, lib, ... }: {
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  options.modules.shells = {
    enable = lib.mkEnableOption "enable home shells group";

    bash.enable = lib.mkEnableOption "bash shell";
    zsh.enable = lib.mkEnableOption "zsh";
  };

  config.modules.shells = with config.modules; {
    bash.enable = lib.mkDefault shells.enable;
    zsh.enable = lib.mkDefault shells.enable;
  };
}
