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
        bg1 = "#${config.colorScheme.palette.bg1}";
        fg0 = "#${config.colorScheme.palette.fg0}";
        fg1 = "#${config.colorScheme.palette.fg1}";
      };

      settings = {
        mode = "drun";
        height = 200;
        width = 400;
        allow_markup = false;
        allow_images = false;
        term = "alacritty";
        layer = "top";
        insensitive = true;
        hide_scroll = true;
        no_actions = true;
      };
    };
  };
}
