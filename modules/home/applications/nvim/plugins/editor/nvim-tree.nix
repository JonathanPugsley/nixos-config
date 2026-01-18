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
                row = 1;
                col = 10000;
              };
            };
          };

          renderer = {
            indent_markers.enable = false;
            special_files = [
              "Makefile"
              "README.md"
              "readme.md"
              "LICENSE"
              ".gitignore"
              "Cargo.toml"
              "Cargo.lock"
            ];

            icons = {
              git_placement = "after";
              modified_placement = "before";
              web_devicons.folder.enable = false;
              show = {
                file = true;
                folder = true;
                folder_arrow = true;
                git = true;
                modified = true;
                hidden = false;
                diagnostics = false;
                bookmarks = true;
              };
            };
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

      # colours
      highlightOverride = let
        colours = {
          background = "#${config.lib.stylix.colors.base00}";
          selection_background = "#${config.lib.stylix.colors.base02}";
          dimmed_foreground = "#${config.lib.stylix.colors.base03}";
          dark_foreground = "#${config.lib.stylix.colors.base04}";
          foreground = "#${config.lib.stylix.colors.base05}";
          red = "#${config.lib.stylix.colors.base08}";
          yellow = "#${config.lib.stylix.colors.base0A}";
          green = "#${config.lib.stylix.colors.base0B}";
          aqua = "#${config.lib.stylix.colors.base0C}";
          blue = "#${config.lib.stylix.colors.base0D}";
          purple = "#${config.lib.stylix.colors.base0E}";
        };
      in {
        # file text
        NvimTreeExecFile.fg = colours.green;
        NvimTreeImageFile.fg = colours.purple;
        NvimTreeSpecialFile.fg = colours.yellow;
        NvimTreeSymlink.fg = colours.aqua;

        # folder text
        NvimTreeRootFolder.fg = colours.dark_foreground;
        NvimTreeFolderName.fg = colours.dark_foreground;
        NvimTreeEmptyFolderName.fg = colours.dark_foreground;
        NvimTreeOpenedFolderName.fg = colours.dark_foreground;
        NvimTreeSymlinkFolderName.fg = colours.aqua;

        # file icons
        NvimTreeFileIcon.fg = colours.foreground;
        NvimTreeSymlinkIcon.fg = colours.aqua;

        # folder icons
        NvimTreeFolderIcon.fg = colours.dimmed_foreground;
        NvimTreeOpenedFolderIcon.fg = colours.dimmed_foreground;
        NvimTreeClosedFolderIcon.fg = colours.dimmed_foreground;
        NvimTreeFolderArrowClosed.fg = colours.dimmed_foreground;
        NvimTreeFolderArrowOpen.fg = colours.dimmed_foreground;
        NvimTreeIndentMarker.fg = colours.dimmed_foreground;

        # picker
        NvimTreeWindowPicker = {
          bg = colours.selection_background;
          fg = colours.foreground;
        };

        # live filter
        NvimTreeLiveFilterPrefix.fg = colours.foreground;
        NvimTreeLiveFilterValue.fg = colours.foreground;

        # clipboard
        NvimTreeCopiedHL.fg = colours.green;
        NvimTreeCutHL.fg = colours.red;

        # bookmarks
        NvimTreeBookmarkIcon.fg = colours.blue;
        NvimTreeBookmarkHL.fg = colours.blue;

        # modified
        NvimTreeModifiedIcon.fg = colours.yellow;
        NvimTreeModifiedFileHL.fg = colours.yellow;
        NvimTreeModifiedFolder.fg = colours.yellow;

        # hidden
        NvimTreeHiddenIcon.fg = colours.dimmed_foreground;
        NvimTreeHiddenFileHL.fg = colours.dimmed_foreground;
        NvimTreeHiddenFolderHL.fg = colours.dimmed_foreground;
        NvimTreeHiddenDisplay.fg = colours.dimmed_foreground;

        # opened
        NvimTreeOpenedHL.fg = colours.selection_background;

        # git
        NvimTreeGitDeletedIcon.fg = colours.red;
        NvimTreeGitDirtyIcon.fg = colours.yellow;
        NvimTreeGitIgnoredIcon.fg = colours.dimmed_foreground;
        NvimTreeGitMergeIcon.fg = colours.aqua;
        NvimTreeGitNewIcon.fg = colours.green;
        NvimTreeGitRenamedIcon.fg = colours.purple;
        NvimTreeGitStagedIcon.fg = colours.blue;

        NvimTreeGitFileDeletedHL.fg = colours.red;
        NvimTreeGitFileDirtyHL.fg = colours.yellow;
        NvimTreeGitFileIgnoredHL.fg = colours.dimmed_foreground;
        NvimTreeGitFileMergeHL.fg = colours.aqua;
        NvimTreeGitFileNewHL.fg = colours.green;
        NvimTreeGitFileRenamedHL.fg = colours.purple;
        NvimTreeGitFileStagedHL.fg = colours.blue;

        NvimTreeGitFolderDeletedHL.fg = colours.red;
        NvimTreeGitFolderDirtyHL.fg = colours.yellow;
        NvimTreeGitFolderIgnoredHL.fg = colours.dimmed_foreground;
        NvimTreeGitFolderMergeHL.fg = colours.aqua;
        NvimTreeGitFolderNewHL.fg = colours.green;
        NvimTreeGitFolderRenamedHL.fg = colours.purple;
        NvimTreeGitFolderStagedHL.fg = colours.blue;
      };
    };
  };
}
