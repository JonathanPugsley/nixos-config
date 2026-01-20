{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.trouble.enable = true;
      keymaps = [
        {
          mode = "n";
          key = "<leader>d";
          action = ":Trouble diagnostics toggle<CR>";
          options.desc = "Toggle Diagnostics";
        }
      ];
    };
  };
}
