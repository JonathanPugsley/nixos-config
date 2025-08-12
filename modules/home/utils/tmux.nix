{ config, pkgs, ... }: {
  config.programs.tmux = {
    enable = true;

    disableConfirmationPrompt = true;
    historyLimit = 1000;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    shell = "\${pkgs.zsh}/bin/zsh";
  };
}
