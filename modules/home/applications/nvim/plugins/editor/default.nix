{ ... }: {
  imports = [
    ./colorizer.nix # highlights hex colour codes in that colour
    ./comment.nix # comment tool for multiple lines
    ./gitsigns.nix # displays git info in the sign column
    ./markdown-preview.nix #
    ./nvim-autopairs.nix # auto brackets, e.g. (), {}, "", e.t.c
    ./nvim-surround.nix # easily re/surround with brackets e.t.c
    ./nvim-tree.nix # file explorer
    ./persistence.nix # session states
    ./render-markdown.nix # improved in-line markdown viewing
    ./telescope.nix # fuzzy finder
    ./trim.nix # auto whitespace trimming
    ./trouble.nix # list for diagnostics, refs, and more for troubleshooting
    ./which-key.nix # popup to show commands when pressing <leader>
  ];
}
