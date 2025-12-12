{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      cursor = {
        no_hardware_cursors = 1;
        no_warps = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc = {
        # hyprland font
        font_family = "JetBrainsMono";

        # focus
        layers_hog_keyboard_focus = true;
        mouse_move_focuses_monitor = false;

        # desktop
        initial_workspace_tracking = 1;
        middle_click_paste = false;
        anr_missed_pings = 8;

        # disable defaults
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_scale_notification = false;
        force_default_wallpaper = 0;
      };
    };
  };
}
