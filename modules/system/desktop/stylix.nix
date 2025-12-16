{ config, lib, pkgs, ... }: {
  options.modules.stylix.enable = lib.mkEnableOption "enable stylix";

  config = lib.mkIf config.modules.stylix.enable {
    stylix = {
      enable = true;
      # fonts = {
      #   serif = {
      #     package = pkgs.dejavu_fonts;
      #     name = "DejaVu Serif";
      #   };
      #   sansSerif = {
      #     package = pkgs.dejavu_fonts;
      #     name = "DejaVu Sans";
      #   };
      #   monospace = {
      #     package = pkgs.jetbrains-mono;
      #     name = "JetBrainsMono";
      #   };
      #   emoji = {
      #     package = pkgs.noto-fonts-color-emoji;
      #     name = "Noto Color Emoji";
      #   };
      # };

      polarity = "dark";
      base16Scheme = {
        scheme = "Gruvbox dark, medium";
        author = "Dawid Kurek (dawikur@gmail.com), morhetz (https=//github.com/morhetz/gruvbox)";
        # base16 theme
        base00 = "282828"; # default background
        base01 = "3c3836"; # lighter background (status bars, line numbers, folds)
        base02 = "504945"; # selection backgrounds
        base03 = "665c54"; # comments, invisibles, line highlighting
        base04 = "bdae93"; # dark foreground
        base05 = "d5c4a1"; # default foreground (caret, delimiters, operators)
        base06 = "ebdbb2"; # light foreground
        base07 = "fbf1c7"; # lightest foreground
        base08 = "fb4934"; # red: variables, xml tags, markup link text, markup lists, diff deleted
        base09 = "fe8019"; # orange: integers, boolean, constants, xml attributes, markup link url
        base0A = "fabd2f"; # yellow: classes, markup bold, search text background
        base0B = "b8bb26"; # green: strings, inherited class, markup code, diff inserted
        base0C = "8ec07c"; # aqua: support, regular expressions, escape characters, markup quotes
        base0D = "83a598"; # blue: functions, methods, attribute ids, headings
        base0E = "d3869b"; # purple: keywords, storage, selector, markup italic, diff changed
        base0F = "d65d0e"; # brown: deprecated, open/close embedded language tags

        # extras (note where used as changing theme may not work as intended unless specified)
        base10 = "1d2021";
      };
    };
  };
}
