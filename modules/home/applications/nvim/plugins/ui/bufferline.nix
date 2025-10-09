{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        mode = "buffers";
        always_show_bufferline = false;
        numbers = "ordinal";
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
}
