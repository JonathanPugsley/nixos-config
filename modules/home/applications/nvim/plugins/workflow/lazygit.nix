{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.lazygit = {
        enable = true;
      };

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
