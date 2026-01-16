{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.telescope.enable = true;

      keymaps = [
        {
          mode = "n";
          key = "<leader>ff";
          action = "<CMD>Telescope find_files<CR>";
          options.desc = "Find Files";
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = "<CMD>Telescope live_grep<CR>";
          options.desc = "Rip Grep";
        }
        {
          mode = "n";
          key = "<leader>fh";
          action = "<CMD>Telescope help_tags<CR>";
          options.desc = "Help Tags";
        }
      ];
    };
  };
}
