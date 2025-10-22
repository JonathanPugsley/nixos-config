{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.nvim-tree = {
      enable = true;

      settings = {
        view = {
          side = "right";
          width = 30;
        };

        renderer = {
          special_files = [ "Makefile" "README.md" "readme.md" "LICENSE" ".gitignore" "Cargo.toml" "Cargo.lock" ];
          indent_markers.enable = true;
          icons = {
            git_placement = "after";
            modified_placement = "before";
            web_devicons.folder = {
              enable = true;
              color = true;
            };
          };
        };

        filters.dotfiles = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options.desc = "Toggle neo-tree";
      }
    ];
  };
}
