{ config, pkgs, inputs, ... }: {
  imports = [
    ./theme/default.nix
    ./alacritty.nix
    ./bluetui.nix
    ./btop.nix
    ./cursor.nix
    ./fastfetch.nix
    ./git.nix
    ./hyprland.nix
    ./librewolf.nix
    ./playerctl.nix
    ./tree.nix
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
  };
}
