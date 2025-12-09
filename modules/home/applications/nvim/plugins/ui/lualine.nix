{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim.plugins.lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = false;

          theme = let
            colours = {
              fg1 = "#${config.colorScheme.palette.fg1}";
              bg0 = "#${config.colorScheme.palette.bg0}";
              grey = "#${config.colorScheme.palette.grey}";
              blue = "#${config.colorScheme.palette.bright_blue}";
              orange = "#${config.colorScheme.palette.orange}";
              red = "#${config.colorScheme.palette.red}";
              green = "#${config.colorScheme.palette.green}";
            };
          in {
            normal = {
              a = { fg = colours.fg1; bg = colours.bg0; gui = "bold"; };
              b = { fg = colours.fg1; bg = colours.bg0; };
              c = { fg = colours.fg1; bg = colours.bg0; };
            };

            insert.a = { fg = colours.blue; bg = colours.bg0; gui = "bold"; };
            visual.a = { fg = colours.orange; bg = colours.bg0; gui = "bold"; };
            replace.a = { fg = colours.red; bg = colours.bg0; gui = "bold"; };
            command.a = { fg = colours.green; bg = colours.bg0; gui = "bold"; };

            inactive = {
              a = { fg = colours.grey; bg = colours.bg0; gui = "bold"; };
              b = { fg = colours.grey; bg = colours.bg0; };
              c = { fg = colours.grey; bg = colours.bg0; };
            };

            disabled = {
              a = { fg = colours.bg0; bg = colours.bg0; gui = "bold"; };
              b = { fg = colours.bg0; bg = colours.bg0; };
              c = { fg = colours.bg0; bg = colours.bg0; };
            };
          };

          disabled_filetypes = {
            statusline = [ "alpha" "NvimTree" ];
            winbar = [ "alpha" "NvimTree" ];
          };

          ignore_focus = [ "alpha" "NvimTree" ];

          component_separators = {
            left = "";
            right = "";
          };

          section_separators = {
            left = "";
            right = "";
          };
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "" ];
          lualine_c = [ "branch" "filename" "diff" ];
          lualine_x = [ "diagnostics" "filetype" "progress" "location" ];
          lualine_y = [ "" ];
          lualine_z = [ "" ];
        };

        inactive_sections = {
          lualine_a = [];
          lualine_b = [];
          lualine_c = [ "filename" ];
          lualine_x = [ "filetype" ];
          lualine_y = [];
          lualine_z = [];
        };
      };
    };
  };
}
