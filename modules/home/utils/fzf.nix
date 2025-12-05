{ config, lib, ... }: {
  options.modules.fzf.enable = lib.mkEnableOption "enable fzf";

  config = lib.mkIf config.modules.fzf.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
