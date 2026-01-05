{ config, lib, ... }: {
  options.modules.zsh.enable = lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.modules.zsh.enable {
    # omz theme
    home.file.".oh-my-zsh-custom/themes/zenline.zsh-theme".source = ./zenline.zsh-theme;

    # zsh
    programs.zsh = {
      enable = true;

      autocd = true;
      autosuggestion.enable = true;
      # defaultKeymap = "viins / vicmd";
      dotDir = "${config.home.homeDirectory}/.config/zsh";
      enableCompletion = true;
      enableVteIntegration = true;
      history = {
        path = "${config.xdg.dataHome}/zsh/zsh_history";
        save = 1000;
        share = true;
        size = 1000;
      };

      syntaxHighlighting.enable = true;

      # omzsh
      oh-my-zsh = {
        enable = true;
        custom = "${config.home.homeDirectory}/.oh-my-zsh-custom";
        theme = "zenline";
      };

      # aliases
      shellAliases = {
        bt = "systemctl start bluetooth.service";
        ns = "nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse";
      };
    };
  };
}
