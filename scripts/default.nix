{ lib, ... }: {
  imports = [
    ./cli-scripts/default.nix
    ./lekker/default.nix
  ];

  config.modules = {
    cli-scripts.enable = lib.mkDefault true;
    lekker.enable = lib.mkDefault true;
  };
}
