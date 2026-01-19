{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
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
        tabstop = 4;            # tab width
        shiftwidth = 4;         # indent width
        softtabstop = 4;        # spaces that equal a tab
        expandtab = true;       # use spaces instead of tabs
        autoindent = true;      # copy indent from current line
        smartindent = false;    # dynamically inserts indentation
        smarttab = false;       # contextual and positional indentation

        # search
        ignorecase = true;      # case insensitive search
        smartcase = true;       # case sensitive if uppercase in search
        hlsearch = false;       # highlight search results
        incsearch = true;       # show matches as you type

        # ui
        number = true;          # show line numbers
        relativenumber = true;  # relative line numbers
        cursorline = true;      # highlight current line
        wrap = false;           # wrap lines
        scrolloff = 8;          # lines to keep visible when scrolling vertically
        sidescrolloff = 10;     # columns to keep visible when scrolling horizontally
        winborder = "single";   # window border for floating windows

        termguicolors = true;   # enable 24-bit color support
        signcolumn = "yes:1";   # show sign column
        cmdheight = 0;          # command line height
        foldenable = false;     # enable folds
        showtabline = 0;        # visibility of tab line (0|1|2 never|>1 page|always)
        splitbelow = true;      # new h-split to the bottom
        splitright = true;      # new v-split to the right
        fillchars.eob = " ";    # characters to fill empty lines

        # file handling
        backup = false;
        writebackup = false;
        swapfile = false;
        undofile = false;
      };

      # theme tweaks
      highlightOverride = {
        StatusLine.bg = "NONE";
        StatusLineNC.bg = "NONE";
        TabLineFill.bg = "NONE";
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>w";
          action = ":w<CR>";
          options.desc = "Write";
        }
        {
          mode = "n";
          key = "<leader>q";
          action = ":q<CR>";
          options.desc = "Quit";
        }
      ];
    };

    stylix.targets.nixvim = {
      enable = true;
      plugin = "base16-nvim";
      transparentBackground.signColumn = true;
      transparentBackground.numberLine = true;
      transparentBackground.main = true;
    };
  };
}
