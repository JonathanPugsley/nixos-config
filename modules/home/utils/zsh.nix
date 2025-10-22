{ config, lib, ... }: {
  options.modules.zsh.enable = lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh = {
      enable = true;

      # settings
      autocd = true;
      autosuggestion.enable = true;
      dotDir = "${config.home.homeDirectory}/.config/zsh";
      enableCompletion = true;
      enableVteIntegration = true;
      syntaxHighlighting.enable = true;
      history = {
        size = 1000;
        extended = true;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };

      # oh my zsh
      oh-my-zsh = {
        enable = true;
        custom = "${config.home.homeDirectory}/.oh-my-zsh-custom";
        theme = "zenline";
      };

      # aliases
      shellAliases = {
        bt = "systemctl start bluetooth.service";
        sshg = "ssh_github";
      };

    };

    home.file.".oh-my-zsh-custom/themes/zenline.zsh-theme".source = ./zenline.zsh-theme;

  };
}
