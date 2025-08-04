{ config, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./fastfetch.nix
    ./git.nix
    ./hyprland.nix
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

    # temporary dark-theme fix for librewolf/wofi
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };

  };
}
