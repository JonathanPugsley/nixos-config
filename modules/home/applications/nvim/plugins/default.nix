{ ... }: {
  imports = [
    ./editor/colorizer.nix
    ./editor/comment.nix
    ./editor/markdown-preview.nix
    ./editor/nvim-autopairs.nix
    ./editor/nvim-surround.nix
    ./editor/render-markdown.nix
    ./editor/trim.nix
    ./lsp-and-cmp/cmp.nix
    ./lsp-and-cmp/conform-nvim.nix
    ./lsp-and-cmp/lsp.nix
    ./lsp-and-cmp/treesitter.nix
    ./ui/alpha.nix
    ./ui/bufferline.nix
    ./ui/gitsigns.nix
    ./ui/lualine.nix
    ./ui/web-devicons.nix
    ./workflow/mini-pick.nix
    ./workflow/nvim-tree.nix
    ./workflow/persistence.nix
    ./workflow/trouble.nix
    ./workflow/which-key.nix
  ];
}
