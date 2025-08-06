{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./features/default.nix
    ./alacritty.nix
    ./bluetui.nix
    ./btop.nix
    ./fastfetch.nix
    ./git.nix
    ./hyprland.nix
    ./cursor.nix
    ./librewolf.nix
    ./playerctl.nix
    ./wofi.nix
  ];

  config = {
    # lets home-manager install and manage itself 
    programs.home-manager.enable = true;

    home = {
      username = "jonny";
      homeDirectory = "/home/jonny";
      stateVersion = "25.05"; # do not change
    };

    # nix-colors
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

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
