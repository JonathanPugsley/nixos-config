{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./gruvbox.nix
    ./alacritty.nix
  ];
  
  config = {
    # gtk theming
    gtk = {
      enable = true;
      theme = {
        name = "gruvbox-dark";
        package = pkgs.gruvbox-dark-gtk;
      };
    };
  };
}
