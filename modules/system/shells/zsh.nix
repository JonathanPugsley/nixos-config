{ config, lib, ... }: {
  options.modules.zsh.enable = lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh.enable = true;
  };
}
