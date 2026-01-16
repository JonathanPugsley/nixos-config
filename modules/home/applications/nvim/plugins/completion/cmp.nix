{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins = {
        # autocompletions
        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
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
          };
        };

        # completion sources
        cmp-buffer.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-path.enable = true;
        cmp_luasnip.enable = true;

        # snippets
        luasnip.enable = true;
      };
    };
  };
}
