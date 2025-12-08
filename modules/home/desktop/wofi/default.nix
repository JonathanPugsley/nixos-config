{ config, lib, pkgs, ... }: {
  options.modules.wofi.enable = lib.mkEnableOption "enable wofi";

  config = lib.mkIf config.modules.wofi.enable {
    programs.wofi =  {
      enable = true;
      style = pkgs.replaceVars ./style.css {
        bg0 = "#${config.colorScheme.palette.bg0}";
        fg1 = "#${config.colorScheme.palette.fg1}";
      };

      settings = {
        # mode = "drun";
        width = 300;
        height = 450;
        prompt = "";
        # xoffset = ;
        # yoffset = ;
        normal_window = false;
        allow_images = true;
        allow_markup = false;
        cache_file = "/dev/null"; # stops re-ordering (disables cache file)
        term = "alacritty";
        # password = "*";
        exec_search = false;
        no_custom_entry = false;
        hide_scroll = true;
        matching = "contains";
        insensitive = true;
        parse_search = false;
        location = "center";
        no_actions = true;
        # lines = 12;
        columns = 1;
        sort_order = "default";
        # gtk_dark = false;
        # search = "";
        # monitor = "";
        # pre_display_command = "";
        orientation = "vertical";
        halign = "fill";
        content_halign = "fill";
        valign = "start";
        filter_rate = "100";
        image_size = 22;
        line_wrap = "off";
        global_coords = false;
        hide_search = false;
        close_on_focus_loss = true;
        dynamic_lines = false;
        layer = "top";
        # copy_exec = "";
        single_click = false;
        # pre_display_exec = "";
        use_search_box = true;

        # keybinds
        key_down = "Ctrl-j";
        key_up = "Ctrl-k";
        key_hide_search = "space";
      };
    };
  };
}
