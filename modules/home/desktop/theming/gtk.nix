{ config, lib, pkgs, ... }: {
  config.gtk = lib.mkIf config.modules.theming.enable {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };
}
