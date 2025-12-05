{ lib, ... }: {
  imports = [
    ./applications/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./shells/default.nix
    ./utils/default.nix
  ];

  config.groups = {
    applications.enable = lib.mkDefault true;
    desktop.enable = lib.mkDefault true;
    shells.enable = lib.mkDefault true;
    utils.enable = lib.mkDefault true;
  };
}
