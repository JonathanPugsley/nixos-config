{ config, lib, ... }: {
  config = lib.mkIf config.modules.utils.yazi.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      shellWrapperName = "yy";
      settings = {
        input.cursor_blink = true;

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

        which = {
          sort_by = "key";
          sort_sensitive = false;
          sort_reverse = false;
          sort_translit = true;
        };
      };

      theme = {
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
