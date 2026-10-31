{ osConfig, lib, ... }: {
  imports = [
    ./applications/default.nix
    ./audio/default.nix
    ./desktop/default.nix
    ./development/default.nix
    ./gaming/default.nix
    ./shells/default.nix
    ./utils/default.nix
  ];

  config.modules = with osConfig.modules; {
    applications.enable = lib.mkDefault applications.enable;
    audio.enable = lib.mkDefault audio.enable;
    desktop.enable = lib.mkDefault desktop.enable;
    development.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault gaming.enable;
    shells.enable = lib.mkDefault true;
    utils.enable = lib.mkDefault true;
  };
}
