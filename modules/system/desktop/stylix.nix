{ config, lib, pkgs, ... }: {
  options.modules.stylix.enable = lib.mkEnableOption "enable stylix";

  config = lib.mkIf config.modules.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = import ./gruvbox-medium.nix;
      polarity = "dark";
      fonts = {
        serif = config.stylix.fonts.sansSerif;
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

    };
  };
}
