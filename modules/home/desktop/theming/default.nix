{ inputs, ... }: {
  imports = [
    ./gruvbox.nix
    ./gtk.nix
    inputs.nix-colors.homeManagerModules.default
  ];
}
