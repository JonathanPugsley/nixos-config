{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.conform-nvim = {
        enable = true;
        autoLoad = true;
        settings = {
          formatters_by_ft = {
            nix = ["alejandra"];
            sh = ["beautysh"];
          };
          format_on_save.__raw = "function() return end"; # disable format on save
          default_format_opts.lsp_format = "fallback";    # fallback to lsp formatting
        };
      };

      extraPackages = with pkgs; [
        alejandra
        beautysh
      ];

      keymaps = [
        {
          mode = "n";
          key = "<leader>lf";
          action.__raw = "function() require('conform').format({ async=true }) end";
          options.desc = "Format Buffer";
        }
      ];
    };
  };
}
