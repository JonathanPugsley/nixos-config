{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.theming.enable {
    gtk = {
      enable = true;
      theme = {
        name = "gruvbox-dark";
        package = pkgs.gruvbox-dark-gtk;
      };
    };
  };
}
