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

      extraConfig = let
        colours = {
          background = "#${config.lib.stylix.colors.base00}";
          foreground = "#${config.lib.stylix.colors.base05}";
          green = "#${config.lib.stylix.colors.base0B}";
        };
      in "
        set -g status-position bottom
        set -g status-justify absolute-centre
        set -g status-style \"bg=default\"
        set -g renumber-windows on

        set -g window-status-style \"fg=default\"
        set -g window-status-format \" #I:#W \"
        set -g window-status-current-style \" bg=${colours.green} fg=${colours.background} bold\"
        set -g window-status-current-format \" #I:#W \"
        set -g window-status-separator \"\"

        set -g status-right \" #h \"
        set -g status-right-style \"bg=${colours.green} fg=${colours.background} bold\"
        set -g status-left \" #S \"
        set -g status-left-style \"bg=${colours.green} fg=${colours.background} bold\"

        set -g message-command-style \"bg=${colours.background}\"
        set -g message-style \"bg=${colours.background}\"
        set -g prompt-cursor-colour \"${colours.foreground}\"

        set -g escape-time 5

        bind r source-file \"~/.config/tmux/tmux.conf\"
      ";
    };
  };
}
