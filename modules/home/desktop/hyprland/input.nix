{ osConfig, config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      input = {
        # keyboard
        kb_layout = osConfig.services.xserver.xkb.layout;
        kb_options = "caps:escape";
        numlock_by_default = false;
        resolve_binds_by_sym = false;
        repeat_rate = 35;
        repeat_delay = 200;

        # mouse
        sensitivity = 0.15;
        accel_profile = "flat";
        force_no_accel = false;
        natural_scroll = false;

        # focus
        follow_mouse = 2;
        focus_on_close = 0;
        float_switch_override_focus = 0;

        # touchpad / trackpad
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 1;
          middle_button_emulation = true;
          tap-to-click = true;
          drag_lock = 0;
          tap-and-drag = true;
        };
      };
    };
  };
}
