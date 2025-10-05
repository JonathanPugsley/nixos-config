{ config, lib, ... }: {
  options.modules.fzf.enable = lib.mkEnableOption "enable fzf";

  config.programs.fzf = lib.mkIf config.modules.fzf.enable {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
