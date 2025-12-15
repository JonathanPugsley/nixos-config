{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "SUPER, Q, killactive"
        "SUPER, E, exec, alacritty -e yazi $HOME"
        "SUPER, R, exec, rofi -show drun"
        "SUPER, T, exec, lekker-resolution"
        "SUPER, RETURN, exec, alacritty"
        "SUPER, O, exec, hyprctl dispatch tagwindow opacity"
        "SUPER, P, exec, lekker-system-menu"

        "SUPER, S, exec, steam"
        "SUPER, D, exec, discord"
        "SUPER, F, fullscreen"
        "SUPER, G, togglefloating"

        "SUPER, X, exec, librewolf"
        "SUPER, N, exec, lekker-notes"
        "SUPER, M, exec, spotify"
        "SUPER ALT SHIFT, H, exit"

        "SUPER, Space, exec, lekker-menu"

        # focus window
        "SUPER, h, movefocus, l"
        "SUPER, j, movefocus, d"
        "SUPER, k, movefocus, u"
        "SUPER, l, movefocus, r"

        # move window
        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, j, movewindow, d"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, l, movewindow, r"

        # focus workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # move to workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"

        # screenshots
        "SUPER SHIFT, S, exec, hyprshot -m region --clipboard-only -z"
        "SUPER SHIFT, F, exec, hyprshot -m output --clipboard-only"
      ];

      binde = [
        # resize window
        "SUPER ALT, h, resizeactive, -30 0"
        "SUPER ALT, j, resizeactive, 0 30"
        "SUPER ALT, k, resizeactive, 0 -30"
        "SUPER ALT, l, resizeactive, 30 0"
      ];

      # mouse binds
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      # multimedia keys
      bindel = [
        ", XF86AudioRaiseVolume, exec, lekker-volume up"
        ", XF86AudioLowerVolume, exec, lekker-volume down"
        ", XF86AudioMute, exec, lekker-volume mute"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        "SUPER, XF86MonBrightnessUp, exec, brightnessctl s 120000"
        "SUPER, XF86MonBrightnessDown, exec, brightnessctl s 1"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pasue"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
