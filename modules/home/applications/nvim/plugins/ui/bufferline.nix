{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.bufferline = {
        enable = true;
        settings = {
          highlights = let
            colours = {
              background = "#${config.lib.stylix.colors.base00}";
              foreground = "#${config.lib.stylix.colors.base05}";
              dimmed_foreground = "#${config.lib.stylix.colors.base03}";
            };
          in {
            # background colours
            fill.bg = colours.background;
            background.bg = colours.background;

            # buffer tabs
            buffer_selected = {
              bg = colours.background;
              italic = false;
            };
            buffer_visible = {
              bg = colours.background;
              italic = false;
            };

            # diagnostic levels (hint & info not shown)
            warning.bg = colours.background;
            warning_selected = {
              bg = colours.background;
              italic = false;
            };
            warning_visible = {
              bg = colours.background;
              italic = false;
            };
            error.bg = colours.background;
            error_selected = {
              bg = colours.background;
              italic = false;
            };
            error_visible = {
              bg = colours.background;
              italic = false;
            };

            # modified indicator next to filename
            modified = {
              bg = colours.background;
              fg = colours.dimmed_foreground;
            };
            modified_selected = {
              bg = colours.background;
              fg = colours.foreground;
            };
            modified_visible = {
              bg = colours.background;
              fg = colours.dimmed_foreground;
            };

            # for duplicate filenames with differing paths (targets the path)
            duplicate = {
              bg = colours.background;
              italic = false;
            };
            duplicate_selected = {
              bg = colours.background;
              italic = false;
            };
            duplicate_visible = {
              bg = colours.background;
              italic = false;
            };

            # active buffer indicator
            indicator_selected.bg = colours.background;
            indicator_visible.bg = colours.background;

            # truncated buffers marker
            trunc_marker.bg = colours.background;
          };

          options = {
            mode = "buffers";
            always_show_bufferline = true;
            numbers = "none";
            indicator.style = "none";
            modified_icon = "●";
            max_name_length = 18;
            max_prefix_length = 15;
            truncate_names = true;
            tab_size = 18;
            diagnostics = "nvim_lsp";
            diagnostics_indicator = "";
            color_icons = true;
            show_buffer_icons = true;
            show_buffer_close_icons = false;
            show_close_icon = false;
            show_tab_indicators = false;
            show_duplicate_prefix = true;
            duplicates_across_groups = true;
            persist_buffer_sort = true;
            move_wraps_at_end = false;
            separator_style = [ "" "" ];
            enforce_regular_tabs = false; # disables de-duplication
            hover.enabled = false;
            sort_by = "insert_after_current";
          };
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>n";
          action = "<CMD>BufferLineCycleNext<CR>";
          options.desc = "Buffer Next";
        }
        {
          mode = "n";
          key = "<leader>p";
          action = "<CMD>BufferLineCyclePrev<CR>";
          options.desc = "Buffer Previous";
        }
        {
          mode = "n";
          key = "<leader>x";
          action = "<CMD>bdelete<CR>";
          options.desc = "Remove Buffer";
        }
      ];
    };
  };
}
