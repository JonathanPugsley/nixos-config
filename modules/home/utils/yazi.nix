{ config, lib, ... }: {
  options.modules.yazi.enable = lib.mkEnableOption "enable yazi";

  config = lib.mkIf config.modules.yazi.enable {
    # stylix.targets.yazi.enable = false;
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          ratio = [ 1 3 3 ];
          sort_by = "natural"; # 1 -> 2 -> 10
          sort_sensitive = false;
          sort_reverse = false;
          sort_dir_first = true;
          sort_translit = true;
          linemode = "none";
          show_hidden = false;
          show_symlink = true;
          scrolloff = 5;
          mouse_events = []; # mouse disabled
          title_format = "";
        };

        preview = {
          wrap = "no";
          tab_size = 4;
          cache_dir = "";
          image_delay = 100;
          image_filter = "triangle";
          image_quality = 70;
        };

        input.cursor_blink = true;

        which = {
          sort_by = "key";
          sort_sensitive = false;
          sort_reverse = false;
          sort_translit = true;
        };
      };

      theme = {
      # let
      #   colours = {
      #     foreground = "#${config.lib.stylix.colors.base06}";
      #     background = "#${config.lib.stylix.colors.base00}";
      #     grey = "#${config.lib.stylix.colors.base04}";
      #     red = "#${config.lib.stylix.colors.base08}";
      #     orange = "#${config.lib.stylix.colors.base09}";
      #     green = "#${config.lib.stylix.colors.base0B}";
      #     blue = "#${config.lib.stylix.colors.base0D}";
      #   };
      # in {
        # mode = {
          # normal_main = { fg = colours.foreground; bg = colours.background; bold = true; };
          # normal_alt = { fg = colours.foreground; bg = colours.background; };
          #
          # # visual/select mode
          # select_main = { fg = colours.orange; bg = colours.background; bold = true; };
          # select_alt = { fg = colours.orange; bg = colours.background; };
          #
          # unset_main = { fg = colours.grey; bg = colours.background; bold = true; };
          # unset_alt = { fg = colours.grey; bg = colours.background; };
        # };

        status = {
          sep_left = {
            open = "";
            close = "";
          };
          sep_right = {
            open = "";
            close= "";
          };
        };

      };
    };
  };
}
