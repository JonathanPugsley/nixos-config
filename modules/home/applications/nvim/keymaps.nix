{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    # Leader
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find Files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Live Grep";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options.desc = "Help Tags";
      }
      # Nvim-Tree
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options.desc = "Toggle neo-tree";
      }
      # Bufferline
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
