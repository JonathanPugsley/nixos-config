{ config, lib, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      bindd = [
        "SUPER, Q, Kill Window, killactive"
        "SUPER SHIFT, Q, Force Kill Window, forcekillactive"
        "SUPER, E, File Manager, exec, alacritty -e yazi $HOME"
        "SUPER, R, Run Apps, exec, rofi -show drun"
        "SUPER, P, Power Menu, exec, lekker-menu-system"
        "SUPER, RETURN, Terminal, exec, alacritty"

        "SUPER, S, Steam, exec, steam"
        "SUPER, D, Discord, exec, discord"
        "SUPER, F, Fullscreen, fullscreen"
        "SUPER, G, Toggle Window Float, togglefloating"
        "SUPER, K, Keybinds Menu, exec, lekker-menu-keybinds"

        "SUPER, X, Browser, exec, librewolf"
        "SUPER, C, Clipboard, exec, lekker-menu-clipboard"
        "SUPER, N, Notes, exec, lekker-notes"
        "SUPER, M, Music, exec, spotify"

        "SUPER, Space, Lekker Menu, exec, lekker-menu"

        # focus window
        "SUPER, H, Window Focus Left, movefocus, l"
        "SUPER, J, Window Focus Down, movefocus, d"
        "SUPER, K, Window Focus Up, movefocus, u"
        "SUPER, L, Window Focus Right, movefocus, r"

        # move window
        "SUPER SHIFT, H, Window Move Left, movewindow, l"
        "SUPER SHIFT, J, Window Move Down, movewindow, d"
        "SUPER SHIFT, K, Window Move Up, movewindow, u"
        "SUPER SHIFT, L, Window Move Right, movewindow, r"

        # focus workspace
        "SUPER, 1, Workspace 1, workspace, 1"
        "SUPER, 2, Workspace 2, workspace, 2"
        "SUPER, 3, Workspace 3, workspace, 3"
        "SUPER, 4, Workspace 4, workspace, 4"
        "SUPER, 5, Workspace 5, workspace, 5"
        "SUPER, 6, Workspace 6, workspace, 6"
        "SUPER, 7, Workspace 7, workspace, 7"
        "SUPER, 8, Workspace 8, workspace, 8"
        "SUPER, 9, Workspace 9, workspace, 9"
        "SUPER, 0, Workspace 10, workspace, 10"

        # move to workspace
        "SUPER SHIFT, 1, Move to Workspace 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, Move to Workspace 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, Move to Workspace 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, Move to Workspace 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, Move to Workspace 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, Move to Workspace 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, Move to Workspace 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, Move to Workspace 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, Move to Workspace 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, Move to Workspace 10, movetoworkspacesilent, 10"

        # screenshots
        "SUPER SHIFT, S, Screenshot Region, exec, hyprshot -m region --clipboard-only -z"
        "SUPER SHIFT, F, Screenshot Output, exec, hyprshot -m active -m output --clipboard-only -z"
      ];

      bindde = [
        # resize window
        "SUPER ALT, H, Resize Window Left, resizeactive, -30 0"
        "SUPER ALT, J, Resize Window Down, resizeactive, 0 30"
        "SUPER ALT, K, Resize Window Up, resizeactive, 0 -30"
        "SUPER ALT, L, Resize Window Right, resizeactive, 30 0"
      ];

      # mouse binds
      binddm = [
        "SUPER, mouse:272, Move Window (Drag), movewindow"
        "SUPER, mouse:273, Resize Window (Drag), resizewindow"
      ];

      # multimedia keys
      binddel = [
        ", XF86AudioRaiseVolume, Increase Volume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, Decrease Volume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, Mute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86MonBrightnessUp, Increase Brightness, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, Decrease Brightness, exec, brightnessctl s 10%-"
        "SUPER, XF86MonBrightnessUp, Max Brightness, exec, brightnessctl s 120000"
        "SUPER, XF86MonBrightnessDown, Min Brightness, exec, brightnessctl s 1"
      ];

      binddl = [
        ", XF86AudioNext, Audio Next, exec, playerctl next"
        ", XF86AudioPrev, Audio Previous, exec, playerctl previous"
        ", XF86AudioPause, Audio Pause, exec, playerctl play-pasue"
        ", XF86AudioPlay, Audio Pause, exec, playerctl play-pause"
      ];
    };
  };
}
