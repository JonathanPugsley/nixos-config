{ config, ... }: {
  imports = [
    ./style.nix
  ];
  config.programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 1.0;
        padding = { x = 10; y = 10; };
        decorations = "None";
      };
      scrolling = {
        history = 1000;
        multiplier = 1;
      };
      cursor.blink_timeout = 0;
      cursor.style = {
        shape = "Beam";
        blinking = "Always";
      };
    };
  };
}
