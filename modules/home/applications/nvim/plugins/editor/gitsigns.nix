{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.gitsigns = {
        enable = true;
        settings = {
          trouble = true;
          current_line_blame = true;
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>gh";
          action = "gitsigns";
          options.silent = true;
        }
      ];
    };
  };
}
