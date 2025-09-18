{ lib, inputs, ... }: {
  imports = [
    ./gruvbox.nix
    ./gtk.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  options.modules.theming.enable = lib.mkEnableOption "enable theming";
}
