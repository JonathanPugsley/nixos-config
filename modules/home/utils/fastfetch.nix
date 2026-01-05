{ config, lib, ... }: {
  options.modules.fastfetch.enable = lib.mkEnableOption "enable fastfetch";

  config = lib.mkIf config.modules.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos";
          type = "builtin";
          padding = {
            top = 0;
            left = 0;
          };
        };

        display.separator = " ";

        modules = [
          {
            type = "title";
            color = {
              user = "default";
              host = "default";
            };
          }
          "break"
          # OS and System Info
          {
            type = "os";
            key = "┌─  ";
            keyColor = "blue";
          }
          {
            type = "kernel";
            key = "├─  ";
            keyColor = "blue";
          }
          {
            type = "packages";
            key = "├─ 󰏖 ";
            keyColor = "blue";
          }
          {
            type = "shell";
            key = "└─  ";
            keyColor = "blue";
          }
          "break"
          # Window Manager, terminal emulator, and styles
          {
            type = "wm";
            key = "┌─  ";
            keyColor = "cyan";
          }
          {
            type = "theme";
            key = "├─  ";
            keyColor = "cyan";
          }
          {
            type = "font";
            key = "├─  ";
            format = "{2}";
            keyColor = "cyan";
          }
          {
            type = "terminal";
            key = "└─  ";
            keyColor = "cyan";
          }
          "break"
          # Hardware Info
          {
            type = "display";
            key = "┌─ 󰍹 ";
            keyColor = "magenta";
            compactType = "original-with-refresh-rate";
          }
          {
            type = "cpu";
            key = "├─  ";
            format = "{1}";
            keyColor = "magenta";
          }
          {
            type = "gpu";
            key = "├─ 󰢮 ";
            format = "{2}";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = "├─  ";
            format = "{1} / {2}";
            keyColor = "magenta";
          }
          {
            type = "disk";
            key = "└─  ";
            folders = "/";
            format = "{1} / {2}";
            keyColor = "magenta";
          }
          "break"
          # Display terminal colours
          {
            type = "colors";
            symbol = "background";
          }
          "break"
        ];
      };
    };
  };
}
