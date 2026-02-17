{ config, lib, pkgs, ... }: {
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

      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      syntaxHighlighting.enable = true;

      # omzsh
      oh-my-zsh = {
        enable = true;
        custom = "${config.home.homeDirectory}/.oh-my-zsh-custom";
        theme = "zenline";
      };

      # aliases
      shellAliases = {
        ns = "nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse";
        nsh = "nix-shell ./shell.nix";
        nsh-rust = "nix-shell ~/dev/nixos-config/modules/home/shells/rust/shell.nix";

        tsm = "tmux-session-manager";
      };
    };
  };
}
