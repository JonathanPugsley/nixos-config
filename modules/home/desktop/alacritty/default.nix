{ config, lib, ... }: {
  options.modules.alacritty.enable = lib.mkEnableOption "enable alacritty";

  config = lib.mkIf config.modules.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 1.0;
          padding = { x = 10; y = 10; };
          decorations = "None";
        };

        cursor = {
          blink_timeout = 0;
          style = {
            shape = "Beam";
            blinking = "Always";
          };
        };

        scrolling = {
          history = 1000;
          multiplier = 1;
        };
      };
    };
  };
}
