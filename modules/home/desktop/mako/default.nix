{ config, lib, pkgs, ...  }: {
  options.modules.mako.enable = lib.mkEnableOption "enable mako";

  config = lib.mkIf config.modules.mako.enable {
    # libnotify
    home.packages = [ pkgs.libnotify ];
    # mako
    services.mako = {
      enable = true;
      settings = {
        # window
        layer = "overlay";
        anchor = "top-right";
        width = 400;
        height = 200;
        # border
        border-size = 2;
        border-radius = 0;
        border-color = "#${config.colorScheme.palette.fg1}";
        # style
        margin = "4";
        padding = "20";
        format = "<b>%s</b>\\n%b";
        background-color = "#${config.colorScheme.palette.bg0}";
        "urgency=high".default-timeout = 0;
        # icons
        max-icon-size = "32";
        # text
        text-alignment = "left";
        text-color = "#${config.colorScheme.palette.fg1}";
        # history
        history = 1;
        max-history = 5;
        max-visible = -1;
        # actions
        on-button-left = "invoke-default-action";
        on-button-right = "dismiss";
        # misc
        sort = "time";
        actions = true;
        markup = true;
        icons = true;
        default-timeout = 5000;
        ignore-timeout = false;
      };
    };
  };
}
