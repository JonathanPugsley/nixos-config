{ config, lib, pkgs, ... }: {
  options.modules.stylix = let
    themeDir = ./themes;
    availableThemes = builtins.listToAttrs (
      map ( file: {
        name = lib.removeSuffix ".nix" file;
        value = themeDir + "/${file}";
      })
      (builtins.filter (f: lib.hasSuffix ".nix" f) (builtins.attrNames (builtins.readDir themeDir)))
    );
  in {
    enable = lib.mkEnableOption "enable stylix";
    scheme = lib.mkOption {
      type = lib.types.enum (builtins.attrNames availableThemes);
      default = "gruvbox";
      description = "Stylix base16 colour scheme for stylix (from ./themes)";
    };
  };

  config = lib.mkIf config.modules.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = import ./themes/${config.modules.stylix.scheme}.nix;
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
