{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim = {
      plugins.lazygit.enable = true;

      keymaps = [
        {
          mode = "n";
          key = "<leader>lg";
          action = ":LazyGit<CR>";
          options.desc = "Open lazygit";
        }
      ];
    };
  };
}
