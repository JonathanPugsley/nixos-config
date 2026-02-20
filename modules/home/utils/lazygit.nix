{ config, lib, ... }: {
  options.modules.lazygit.enable = lib.mkEnableOption "enable lazygit";

  config = lib.mkIf config.modules.lazygit.enable {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
