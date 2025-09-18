{ config, lib, ... }: {
  options.modules.zsh.enable = lib.mkEnableOption "enable zsh";

  config.programs.zsh = lib.mkIf config.modules.zsh.enable {
    enable = true;
  };
}
