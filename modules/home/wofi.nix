{ config, pkgs, ... }: {
  config.programs.wofi = {
    enable = true;
    style = builtins.readFile ./theme/wofi-style.css;
    settings = {
      mode = "drun";
      height = 200;
      width = 400;
      allow_markup = false;
      allow_images = false;
      term = "alacritty";
      layer = "top";
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
    };
  };
}
