{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.alacritty.enable {
    programs.alacritty.settings = {
      colors = with config.colorScheme.palette; {
        bright = {
          black = "0x${bg0}";
          blue = "0x${bright_blue}";
          cyan = "0x${bright_aqua}";
          green = "0x${bright_green}";
          magenta = "0x${bright_purple}";
          red = "0x${bright_red}";
          white = "0x${fg0}";
          yellow = "0x${bright_yellow}";
        };

        normal = {
          black = "0x${bg1}";
          blue = "0x${bright_blue}";
          cyan = "0x${bright_aqua}";
          green = "0x${bright_green}";
          magenta = "0x${bright_purple}";
          red = "0x${bright_red}";
          white = "0x${fg1}";
          yellow = "0x${bright_yellow}";
        };

        cursor = {
          cursor = "0x${fg0}";
          text = "0x${fg1}";
        };

        primary = {
          foreground = "0x${fg1}";
          background = "0x${bg0}";
        };
      };
    };
  };
}
