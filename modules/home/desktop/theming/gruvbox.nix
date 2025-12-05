{ config, lib, ... }: {
  config = lib.mkIf config.modules.theming.enable {
    colorScheme = {
      name = "gruvbox";
      author = "morhetz (https://github.com/morhetz/gruvbox)";
      variant = "dark";
      palette = {
        bg0 = "282828"; # ----- h:"1d2021", m:"282828", s:"32302f"
        bg1 = "3c3836"; # ----
        bg2 = "504945"; # ---
        bg3 = "665c54"; # --
        bg4 = "7c6f64"; # -
        fg4 = "a89984"; # +
        fg3 = "bdae93"; # ++
        fg2 = "d5c4a1"; # +++
        fg1 = "ebdbb2"; # ++++
        fg0 = "fbf1c7"; # +++++ h:"f9f5d7", m:"fbf1c7", s:"f2e5bc"
        # colours
        bright_red = "fb4934";
        red = "cc241d";
        bright_orange = "fe8019";
        orange = "d65d0e";
        bright_yellow = "fabd2f";
        yellow = "d79921";
        bright_green = "b8bb26";
        green = "98971a";
        bright_aqua = "8ec07c";
        aqua = "689d6a";
        bright_blue = "83a598";
        blue = "458588";
        bright_purple = "d3869b";
        purple = "b16286";
      };
    };
  };
}
