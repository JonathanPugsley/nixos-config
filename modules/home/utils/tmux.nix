{ config, lib, ... }: {
  options.modules.tmux.enable = lib.mkEnableOption "enable tmux";

  config = lib.mkIf config.modules.tmux.enable {
    programs.tmux = {
      enable = true;
      disableConfirmationPrompt = true;
      historyLimit = 1000;
      keyMode = "vi";
      mouse = true;
      newSession = true;
      shell = "\${pkgs.zsh}/bin/zsh";
    };
  };
}
