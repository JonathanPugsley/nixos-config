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

            # styling
            component_separators = { left = ""; right = ""; };
            section_separators = { left = ""; right = ""; };
            disabled_filetypes.statusline = [ "alpha" "NvimTree" ];

            # colours
            theme = {
              normal = {
                a = { fg = "#${config.lib.stylix.colors.base05}"; gui = "bold"; };
                c.fg = "#${config.lib.stylix.colors.base05}";
              };
              inactive = {
                a.fg = "#${config.lib.stylix.colors.base03}";
                c.fg = "#${config.lib.stylix.colors.base03}";
              };

              insert.a = { fg = "#${config.lib.stylix.colors.base0D}"; gui = "bold"; };
              visual.a = { fg = "#${config.lib.stylix.colors.base09}"; gui = "bold"; };
              replace.a = { fg = "#${config.lib.stylix.colors.base08}"; gui = "bold"; };
              command.a = { fg = "#${config.lib.stylix.colors.base0B}"; gui = "bold"; };
            };
          };
        };
      };
    };
  };
}
