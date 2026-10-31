{ lib, ... }: {
  imports = [
    ./applications/default.nix
    ./audio/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./gaming/default.nix
    ./hardware/default.nix
    ./shells/default.nix
    ./theming/default.nix
    ./users/default.nix
    ./utils/default.nix
  ];

  config.modules = {
    applications.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    desktop.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault true;
    theming.enable = lib.mkDefault true;
    utils.enable = lib.mkDefault true;
  };
}
