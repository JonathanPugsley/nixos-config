{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.stylix.nixosModules.stylix ];

  options.modules.theming.stylix = let
    themeDir = ./themes;
    availableThemes = builtins.listToAttrs (
      map ( file: {
        name = lib.removeSuffix ".nix" file;
        value = themeDir + "/${file}";
      })
      (builtins.filter (f: lib.hasSuffix ".nix" f) (builtins.attrNames (builtins.readDir themeDir)))
    );
  in {
    scheme = lib.mkOption {
      type = lib.types.enum (builtins.attrNames availableThemes);
      default = "everforest";
      description = "Stylix base16 colour scheme for stylix (from ./themes)";
    };
  };

  config = lib.mkIf config.modules.theming.stylix.enable {
    stylix = {
      enable = true;
      base16Scheme = import ./themes/${config.modules.theming.stylix.scheme}.nix;
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
