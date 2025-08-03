{ config, pkgs, ... }: {
  config.programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_markup = false;
      allow_images = true;
      image_size = 32;
      term = "alacritty.desktop";
      layer = "top";
      insensitive = true;
      no_actions = true;
    };
  };
}
