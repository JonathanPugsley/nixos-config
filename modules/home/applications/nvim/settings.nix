{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    # manual
    enableMan = true;

    opts = {
      # clipboard
      clipboard = "unnamedplus";

      # line numbering
      number = true;
      relativenumber = true;

      # tabs
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smarttab = true;

      # search
      ignorecase = true;
      smartcase = true;

      # line highlight
      cursorline = true;
    };

    # theme
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        background = "dark";
        contrast = "medium";
      };
    };
  };
}
