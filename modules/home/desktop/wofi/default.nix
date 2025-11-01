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
        mode = "drun";
        prompt = "";
        width = 300;
        lines = 12;
        allow_markup = false;
        allow_images = true;
        term = "alacritty";
        layer = "top";
        insensitive = true;
        hide_scroll = true;
        no_actions = true;
        image_size = 30;

        key_down = "Ctrl-j";
        key_up = "Ctrl-k";
        key_hide_search = "space";
      };
    };
  };
}
