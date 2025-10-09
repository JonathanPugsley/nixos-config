{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.lualine = {
      enable = true;
      settings = {
        options.disabled_filetypes = {
          statusline = ["alpha"];
          winbar = ["alpha"];
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" "diagnostics" ];
          lualine_c = [ "filename" ];
          lualine_x = [ "encoding" "fileformat" ];
          lualine_y = [ "filetype" "progress" ];
          lualine_z = [ "location" ];
        };
        inactive_sections = {
          lualine_a = [];
          lualine_b = [];
          lualine_c = [ "diff" "filename" ];
          lualine_x = [ "filetype" ];
          lualine_y = [];
          lualine_z = [];
        };
      };
    };
  };
}
