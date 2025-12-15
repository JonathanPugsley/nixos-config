{ config, lib, ... }: {
  options.modules.hyprlock.enable = lib.mkEnableOption "enable hyprlock";

  config = lib.mkIf config.modules.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          hide_cursor = true;
        };

        input-field = {
          size = "300, 60";
          outline_thickness = 4;
          dots_center = true;
          fade_on_empty = false;
          placeholder_text = "";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
