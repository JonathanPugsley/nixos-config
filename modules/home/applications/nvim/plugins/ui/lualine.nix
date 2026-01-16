{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.lualine = {
        enable = true;
        settings = {
          # layout
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

          options = {
            globalstatus = false;

            # more layout
            component_separators = { left = ""; right = ""; };
            section_separators = { left = ""; right = ""; };
            disabled_filetypes.statusline = [ "alpha" "NvimTree" ];

            # colours
            theme = let
              colours = {
                foreground = "#${config.lib.stylix.colors.base06}";
                background = "#${config.lib.stylix.colors.base00}";
                dimmed_foreground = "#${config.lib.stylix.colors.base03}";
                red = "#${config.lib.stylix.colors.base08}";
                orange = "#${config.lib.stylix.colors.base09}";
                green = "#${config.lib.stylix.colors.base0B}";
                blue = "#${config.lib.stylix.colors.base0D}";
              };
            in {
              normal = {
                a = { fg = colours.foreground; bg = colours.background; gui = "bold"; };
                b = { fg = colours.foreground; bg = colours.background; };
                c = { fg = colours.foreground; bg = colours.background; };
              };

              insert.a = { fg = colours.blue; bg = colours.background; gui = "bold"; };
              visual.a = { fg = colours.orange; bg = colours.background; gui = "bold"; };
              replace.a = { fg = colours.red; bg = colours.background; gui = "bold"; };
              command.a = { fg = colours.green; bg = colours.background; gui = "bold"; };

              inactive = {
                a = { fg = colours.dimmed_foreground; bg = colours.background; gui = "bold"; };
                b = { fg = colours.dimmed_foreground; bg = colours.background; };
                c = { fg = colours.dimmed_foreground; bg = colours.background; };
              };

              disabled = {
                a = { fg = colours.background; bg = colours.background; gui = "bold"; };
                b = { fg = colours.background; bg = colours.background; };
                c = { fg = colours.background; bg = colours.background; };
              };
            };
          };
        };
      };
    };
  };
}
