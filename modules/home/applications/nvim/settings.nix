{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    enableMan = true;
    editorconfig.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      # tabs/indents
      autoindent = true; # copies previous line's indentation
      smartindent = false; # dynamically inserts indentation
      expandtab = true; # replace tabs with spaces
      shiftwidth = 4; # width to shift/move lines with motions/autoindentations
      smarttab = false; # contextual and positional indentation
      softtabstop = 4; # number of spaces inseted when pressing tab *key*
      tabstop = 4; # number of spaces = tab *chacater* (\t)
      # ui
      cmdheight = 0; # 0: hide command line unless writing command
      cursorline = true; # highlight the currently selected line
      foldenable = false; # enables folds
      number = true; # show line number
      relativenumber = true; # numbers relative to currently selected line
      scrolloff = 6; # lines to keep visible when scrolling vertically
      sidescrolloff = 10; # columns to keep visible when scrolling horizontally
      showtabline = 2; # visibility of the tab line 0/1/2 : never/>1 page/always
      signcolumn = "yes:1"; # visibility of sign column
      splitbelow = true; # new h-split to the bottom
      splitright = true; # new v-split to the right
      termguicolors = true; # enable 24-bit color support
      wrap = false; # wraps text when reaching the width of the window
      fillchars = {
        eob = " "; # characters to fill empty lines
      };
      # general
      ignorecase = true; # matches non-case sensitive
      smartcase = true; # overrides ignorecase if search pattern contains uppercase
      swapfile = false; # enable creation of a swapfile
    };

    colorschemes.gruvbox = {
      enable = true;
      settings = {
        background = "dark";
        contrast = "medium";
      };
    };
  };
}
