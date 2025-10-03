{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins = {
      # Autocompletion
      cmp.enable = true;

      # Snippets
      luasnip.enable = true;

      # Telescope - Fuzzy Finder
      telescope.enable = true;

      # Icons
      web-devicons.enable = true;

      # Lualine - Status Bar
      lualine.enable = true;

      # Nvim-tree - File Explorer
      nvim-tree.enable = true;
    };
  };
}
