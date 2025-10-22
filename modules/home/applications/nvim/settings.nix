{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    enableMan = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      autoindent = true;
      clipboard = "unnamedplus";
      cmdheight = 0;
      cursorline = true;
      expandtab = true;
      ignorecase = true;
      number = true;
      relativenumber = true;
      scrolloff = 6;
      shiftwidth = 4;
      showtabline = 4;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      smarttab = true;
      softtabstop = 4;
      splitright = true;
      swapfile = false;
      tabstop = 4;
      wrap = false;

      fillchars = {
        eob = " ";
      };
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
