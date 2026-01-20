{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.which-key = {
        enable = true;
        settings = {
          delay = 500;
          icons.mappings = false;
          win.border = "single";
        };
      };

      highlightOverride = let
        colours = {
          foreground = "#${config.lib.stylix.colors.base05}";
          dimmed_foreground = "#${config.lib.stylix.colors.base03}";
        };
      in {
        WhichKeyTitle.fg = colours.foreground; # keys pressed
        WhichKeyDesc.fg = colours.foreground;
        WhichKeyGroup.fg = colours.dimmed_foreground;
        WhichKeySeparator.fg = colours.dimmed_foreground;
      };
    };
  };
}
