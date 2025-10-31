{ config, lib, pkgs, ... }: {
  options.modules.wofi.enable = lib.mkEnableOption "enable wofi";

  config = lib.mkIf config.modules.wofi.enable {
    # power menu
    home.packages = [ pkgs.wofi-power-menu ];
    xdg.configFile."wofi-power-menu.toml" = {
      enable = true;
      executable = false;
      text = builtins.readFile ./wofi-power-menu.toml;
    };

    # wofi
    programs.wofi =  {
      enable = true;
      style = pkgs.replaceVars ./style.css {
        bg0 = "#${config.colorScheme.palette.bg0}";
        fg1 = "#${config.colorScheme.palette.fg1}";
      };

      settings = {
        mode = "drun";
        prompt = "";
        height = 200;
        width = 400;
        allow_markup = false;
        allow_images = true;
        term = "alacritty";
        layer = "top";
        insensitive = true;
        hide_scroll = true;
        hide_search = true;
        no_actions = true;
        image_size = 20;

        key_down = "Ctrl-j";
        key_up = "Ctrl-k";
        key_hide_search = "space";
      };
    };
  };
}
