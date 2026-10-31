{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
