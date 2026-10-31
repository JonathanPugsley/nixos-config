{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
