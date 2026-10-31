require("colors")
require("xkb")

hl.config({
    general = {
        border_size = 2,
        ["col.active_border"] = base05,
        ["col.inactive_border"] = base03,
        gaps_in = 5,
        gaps_out = 10,
        layout = "master",
    },

    decoration = {
        blur = { enabled = false },
        shadow = { enabled = false },
    },

    animations = { enabled = true },

    input = {
        accel_profile = "flat",
        float_switch_override_focus = 0,
        focus_on_close = 2,
        follow_mouse = 2,
        force_no_accel = false,
        kb_layout = xkb_layout,
        kb_options = "caps:control";
        repeat_delay = 200,
        repeat_rate = 35,
        sensitivity = 0.15,
        ["touchpad.natural_scroll"] = true,
    },

    master = {
        mfact = 0.60,
        orientation = "left",
        slave_count_for_center_master = 0,
        center_master_fallback = "left";
        smart_resizing = true,
        drop_at_cursor = true,
    },

    cursor = {
        hide_on_key_press = true,
        no_hardware_cursors = 1,
        no_warps = true,
    },

    misc = {
        bell_sound = "none",
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        initial_workspace_tracking = 2,
        middle_click_paste = false,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})
