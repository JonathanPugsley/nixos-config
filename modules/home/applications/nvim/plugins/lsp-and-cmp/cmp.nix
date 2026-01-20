{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins = {
        # completion sources
        cmp-buffer.enable = true;
        cmp-nvim-lsp.enable = true; # lsp completions
        cmp-path.enable = true;     # file system paths
        cmp_luasnip.enable = true;  # snippets

        # autocompletions
        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
            performance.max_view_entries = 10;
            sources = [
              { name = "nvim_lsp"; }
              { name = "nvim_lua"; }
              { name = "path"; }
              { name = "buffer"; }
              { name = "luasnip"; }
            ];

            mapping = {
              "<C-j>" = "cmp.mapping.select_next_item()";  # next item
              "<C-k>" = "cmp.mapping.select_prev_item()";  # previous item
              "<C-e>" = "cmp.mapping.abort()";             # close autocomplete menu
              "<C-Tab>" = "cmp.mapping.complete()";        # open autocomplete menu
              "<Tab>" = "cmp.mapping.confirm({ select = true })";  # confirm
            };

            window = {
              completion = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None";
                scrollbar = false;
                side_padding = 0;
                col_offset = 0;
              };

              documentation = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None";
                col_offset = 0;
              };
            };
          };
        };
        # snippets
        luasnip.enable = true;
      };

      highlightOverride = {
        CmpItemAbbr.fg = "#${config.lib.stylix.colors.base05}";
        CmpItemAbbrMatch.fg = "#${config.lib.stylix.colors.base0D}";
        CmpItemAbbrMatchFuzzy.fg = "#${config.lib.stylix.colors.base0D}";
      };
    };
  };
}
