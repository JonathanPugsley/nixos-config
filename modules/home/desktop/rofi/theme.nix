{ config, lib, ... }: {
  config = lib.mkIf config.modules.rofi.enable {
    programs.rofi.theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "configuration" = {
        modi = "drun,window";
        show-icons = false;
        display-drun = "";
        display-window = "";
        drun-display-format = "{name}";
        drun-show-actions = false;
        window-format = "{c}: {t}";
        font = "${config.stylix.fonts.monospace.name} 12";
      };

      "*" = {
        background = mkLiteral "#${config.lib.stylix.colors.base00}FF";
        background-alt = mkLiteral "#${config.lib.stylix.colors.base01}FF";
        foreground-alt = mkLiteral "#${config.lib.stylix.colors.base04}FF";
        foreground = mkLiteral "#${config.lib.stylix.colors.base05}FF";
        red = mkLiteral "#${config.lib.stylix.colors.base08}FF";
        green = mkLiteral "#${config.lib.stylix.colors.base0B}FF";
      };

      "window" = {
        enabled = true;
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "400px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";

        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "2px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        cursor = "default";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "10px";
        border = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        children = map mkLiteral [ "inputbar" "message" "listview" "mode-switcher" ];
      };

      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "8px";
        border = mkLiteral "0px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        enabled = true;
        vertical-align = mkLiteral "0.5";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };

      "entry" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "";
        placeholder-color = mkLiteral "@foreground-alt";
      };

      "listview" = {
        enabled = true;
        columns = 1;
        lines = 14;
        cycle = false;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;

        spacing = mkLiteral "5px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = "default";
      };

      "element" = {
        enabled = true;
        spacing = mkLiteral "8px";
        margin = mkLiteral "0px";
        padding = mkLiteral "8px";
        border = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@red";
      };

      "element normal.active" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@green";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@foreground";
        text-color = mkLiteral "@background";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@red";
        text-color = mkLiteral "@background";
      };

      "element selected.active" = {
        background-color = mkLiteral "@green";
        text-color = mkLiteral "@background";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      "button" = {
        padding = mkLiteral "8px";
        border = mkLiteral "0px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "button selected" = {
        background-color = mkLiteral "@foreground";
        text-color = mkLiteral "@background";
      };

      "message" = {
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      "textbox" = {
        padding = mkLiteral "8px";
        border = mkLiteral "0px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
        placeholder-color = mkLiteral "@foreground";
        blink = true;
        markup = true;
      };

      "error-message" = {
        padding = mkLiteral "8px";
        border = mkLiteral "0px";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
    };
  };
}
