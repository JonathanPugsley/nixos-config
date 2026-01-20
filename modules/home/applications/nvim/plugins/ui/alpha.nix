{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.alpha = {
        enable = true;

        settings.layout = let
          # map keys to command
          key_commands = {
            n = ":ene<CR>";
            f = ":Pick files<CR>";
            g = ":Pick grep_live<CR>";
            l = ":lua local latest = MiniSessions.get_latest(); if latest then MiniSessions.read(latest) end<CR>";
            q = ":qa<CR>";
          };

          # commands and keys
          button = { val, key }: {
            type = "button";
            val = val;
            opts = {
              keymap = [ "n" key key_commands.${key} { noremap = true; silent = true; nowait = true; } ];
              shortcut = key;
              position = "center";
              cursor = 3;
              hl = "Normal";
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Title";
            };
          };

          # padding
          padding = val: { type = "padding"; inherit val; };
        in [
          (padding 4)
          {
            type = "text";
            val = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
            opts = { hl = "Title"; position = "center"; };
          }
          (padding 6)
          # buttons
          (button { val = "  New File"; key = "n"; })
          (padding 1)
          (button { val = "  Find File"; key = "f"; })
          (padding 1)
          (button { val = "󰈭  Find Word"; key = "g"; })
          (padding 1)
          (button { val = "  Restore Session"; key = "l"; })
          (padding 1)
          (button { val = "⏻  Quit Neovim"; key = "q"; })
        ];
      };
    };
  };
}
