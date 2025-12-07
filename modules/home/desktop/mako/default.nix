{ config, lib, pkgs, ...  }: {
  options.modules.mako.enable = lib.mkEnableOption "enable mako";

  config = lib.mkIf config.modules.mako.enable {
    # libnotify
    home.packages = [ pkgs.libnotify ];

    # mako
    services.mako = {
      enable = true;
      settings = {
        # global
        max-history = 20;
        sort = "+time";

        # actions
        on-button-left = "invoke-default-action";
        on-button-right = "dismiss";
        on-button-middle = "none";
        on-touch = "invoke-default-action";
        on-notify = "none";

        # style
        font = "JetBrainsMono 10";
        background-color = "#${config.colorScheme.palette.bg0}E6";
        text-color = "#${config.colorScheme.palette.fg1}FF";
        width = 300;
        height = 100;
        outer-margin = 0;
        margin = 4;
        padding = 14;
        border-size = 2;
        border-color = "#${config.colorScheme.palette.bg0}FF";
        border-radius = 0;
        progress-color = "#${config.colorScheme.palette.fg1}FF";
        icons = true;
        max-icon-size = 32;
        icon-path = "";
        icon-location = "left";
        icon-border-radius = 0;
        markup = true;
        actions = true;
        history = 1;
        format = "<b>%s</b>\\n%b";
        text-alignment = "left";
        default-timeout = 5000;
        ignore-timeout = false;
        group-by = "none";
        max-visible = 5;
        output = "";
        layer = "overlay";
        anchor = "top-right";

        # criteria
        "mode=dnd".invisible = 1;
        "mode=zen".invisible = 1;
        "mode=zen app-name=notify-send".invisible = 0;
        "urgency=high".default-timeout = 0;
        "app-name=lekker-osd" = {
          font = "JetBrainsMono 20";
          history = 0;
          width = 120;
          height = 120;
          border-radius = 10;
          group-by = "app-name";
          format = "<b>%s</b>\\n%b";
          text-alignment = "center";
          default-timeout = 1500;
          anchor = "center";
        };
      };
    };
  };
}
