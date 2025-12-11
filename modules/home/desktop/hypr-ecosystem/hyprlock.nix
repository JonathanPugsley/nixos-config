{ config, lib, ... }: {
  config = lib.mkIf config.modules.hypr-ecosystem.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          hide_cursor = true;
        };

        background = {
          color = "rgb(000000)";
        };

        input-field = {
          size = "300, 60";
          outline_thickness = 4;
          dots_center = true;
          outer_color = "rgb(${config.colorScheme.palette.fg1})";
          inner_color = "rgb(${config.colorScheme.palette.bg0})";
          font_color = "rgb(${config.colorScheme.palette.fg1})";
          check_color = "rgb(${config.colorScheme.palette.fg1})";
          fail_color = "rgb(${config.colorScheme.palette.red})";
          fade_on_empty = false;
          placeholder_text = "";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
