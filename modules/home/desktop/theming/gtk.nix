{ config, pkgs, ... }: {
  config.gtk = {
    enable = true;
    theme = { 
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };
}
