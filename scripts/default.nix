{ lib, ... }: {
  imports = [
    ./cli-scripts/default.nix
    ./lekker/default.nix
    ./wrapper-scripts/default.nix
  ];

  config.modules = {
    cli-scripts.enable = lib.mkDefault true;
    lekker.enable = lib.mkDefault true;
    wrapper-scripts.enable = lib.mkDefault true;
  };
}
