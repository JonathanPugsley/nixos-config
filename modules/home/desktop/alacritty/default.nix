{ config, lib, ... }: {
  options.modules.alacritty.enable = lib.mkEnableOption "enable alacritty";

  config = lib.mkIf config.modules.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
          padding = { x = 10; y = 10; };
          startup_mode = "Windowed";
        };

        cursor = {
          style = {
            shape = "Block";
            blinking = "On";
          };
          blink_timeout = 0;
          unfocused_hollow = true;
        };

        scrolling = {
          history = 1000;
          multiplier = 1;
        };
      };
    };
  };
}
