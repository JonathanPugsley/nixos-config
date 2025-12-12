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

      dwindle = {
        pseudotile = true;
        force_split = 2;
        smart_resizing = true;
        use_active_for_splits = true;
        default_split_ratio = 1;
        single_window_aspect_ratio = "4 3";
      };

    };
  };
}
