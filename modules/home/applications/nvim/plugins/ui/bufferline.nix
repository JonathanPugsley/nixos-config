{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.bufferline = {
        enable = true;
        settings.options = {
          diagnostics = "nvim_lsp";
          mode = "buffers";
          always_show_bufferline = true;
          numbers = "none";
          show_buffer_close_icons = false;
          show_close_icon = false;
          show_tab_indicators = false;
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>n";
          action = ":bn<CR>";
          options.desc = "Buffer Next";
        }
        {
          mode = "n";
          key = "<leader>p";
          action = ":bp<CR>";
          options.desc = "Buffer Previous";
        }
        {
          mode = "n";
          key = "<leader>x";
          action = ":bd<CR>";
          options.desc = "Remove Buffer";
        }
      ];
    };
  };
}
