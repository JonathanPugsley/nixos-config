{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.alpha = {
        enable = true;
        settings.layout = let
          padding = val: {
            type = "padding";
            inherit val;
          };
        in [
          (padding 4)
          {
            val = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
            type = "text";
            opts = {
              hl = "Title";
              position = "center";
            };
          }
          (padding 6)
          {
            type = "button";
            val = "  New File";
            opts = {
              keymap = [ "n" "n" ":ene<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "n";
              position = "center";
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Find File";
            opts = {
              keymap = [ "n" "f" ":Pick files<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "f";
              position = "center";
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "󰈭  Find Word";
            opts = {
              keymap = [ "n" "g" ":Pick grep_live<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "g";
              position = "center";
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Restore Session";
            opts = {
              keymap = [ "n" "s" "<CMD>lua require('persistence').select()<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "s";
              position = "center";
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "⏻  Quit Neovim";
            opts = {
              keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "q";
              position = "center";
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          }
        ];
      };
    };
  };
}
