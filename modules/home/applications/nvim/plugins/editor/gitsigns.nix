{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.gitsigns = {
      enable = true;
      settings = {
        trouble = true;
        current_line_blame = false;
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
}
