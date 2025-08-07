{ config, pkgs, inputs, ... }: {
  imports = [
    ./applications/default.nix
    ./desktop/default.nix
    ./misc/default.nix
    ./utils/default.nix
  ];
  # still need to abstract this out :/
  config = {
    programs.home-manager.enable = true;

    home = {
      username = "jonny";
      homeDirectory = "/home/jonny";
      stateVersion = "25.05"; # do not change
    };
  };
}
