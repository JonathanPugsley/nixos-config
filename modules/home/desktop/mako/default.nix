{ config, lib, pkgs, ...  }: {
  options.modules.mako.enable = lib.mkEnableOption "enable mako";

  config = lib.mkIf config.modules.mako.enable {
    # libnotify
    home.packages = [ pkgs.libnotify ];

    # mako
    services.mako = {
      enable = true;
      # colours
      backgroundColor = "#${config.colorScheme.palette.bg0}";
      borderColor = "#${config.colorScheme.palette.bg1}";
      textColor = "#${config.colorScheme.palette.fg1}";

      settings = {
        # appearance
        layer = "overlay";
        anchor = "top-right";
        width = 400;
        height = 200;
        margin = "4";
        border-size = 2;
        border-radius = 0;
        padding = "20";
        max-icon-size = "32";
        text-alignment = "left";
        format = "<b>%s</b>\\n%b";
        "urgency=high".default-timeout = 0;
        background-opacity = 0;

        # history
        history = 1;
        max-history = 5;
        max-visible = -1;

        # actions
        on-button-left = "invoke-default-action";
        on-button-right = "dismiss";

        # misc
        sort = "-time";
        actions = true;
        markup = true;
        icons = true;
        default-timeout = 5000;
        ignore-timeout = false;
      };
    };
  };
}
