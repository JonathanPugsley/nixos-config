{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.nvim-tree = {
        enable = true;
        settings = {
          filters.dotfiles = true;

          view = {
            float = {
              enable = true;
              quit_on_focus_loss = true;
              open_win_config = {
                relative = "editor";
                border = "single";
                width = 40;
                height = 30;
                # position: top right
                row = 1;
                col = 10000;
              };
            };
          };

          renderer = {
            special_files = [ "Makefile" "README.md" "readme.md" "LICENSE" ".gitignore" "Cargo.toml" "Cargo.lock" ];
            icons = {
              git_placement = "after";
              modified_placement = "before";
              web_devicons.folder = {
                enable = true;
                color = true;
              };
            };
            indent_markers.enable = false;
          };
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>e";
          action = "<CMD>NvimTreeToggle<CR>";
          options.desc = "Toggle neo-tree";
        }
      ];
    };
  };
}
