{ config, lib, pkgs, ... }: {
  options.modules.tmux.enable = lib.mkEnableOption "enable tmux";

  config = lib.mkIf config.modules.tmux.enable {
    programs.tmux = {
      enable = true;

      terminal = "screen-256color";
      shortcut = "SPACE";
      baseIndex = 1;
      keyMode = "vi";
      historyLimit = 1000;
      shell = "${pkgs.zsh}/bin/zsh";

      extraConfig = "
        set -g renumber-windows on
        set -g status-position top
        set -g status-justify absolute-centre
        set -g status-style \"bg=default\"
        set -g window-status-style \"fg=default\"
        set -g window-status-current-style \"fg=cyan bold\"
        set -g status-right \"#S\"
        set -g status-left \"\"

        set -g escape-time 5

        bind r source-file \"~/.config/tmux/tmux.conf\"
      ";
    };
  };
}
