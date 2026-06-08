{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      general.layout = "master";

      master = {
        allow_small_split = false;
        mfact = 0.60;
        new_status = "slave";
        new_on_top = false;
        smart_resizing = true;
        drop_at_cursor = true;
        orientation = "left";
        slave_count_for_center_master = 0;
      };
    };
  };
}
