{ config, lib, ... }: {
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.modules.hyprland.enable {
    "$mod" = "SUPER";

    "$browser" = "librewolf";
    "$editor" = "codium";
    "$fileManager" = "$terminal -e $termFileManager $HOME";
    #"$lock" = "hyprlock";
    "$menu" = "wofi";
    "$music" = "spotify";
    #"$notes" = "obsidian";
    "$termFileManager" = "yazi";
    "$terminal" = "alacritty";
    #"$top" = "$terminal -e btop";

    bind = [
      "$mod, Q, killactive,"
      "$mod, E, exec, $fileManager"
      "$mod, R, exec, $menu"
      "$mod SHIFT, T, exec, toggleres"
      "$mod, RETURN, exec, $terminal"

      "$mod, S, exec, steam"
      "$mod, D, exec, discord"
      "$mod, F, fullscreen"
      "$mod, G, togglefloating"

      "$mod, X, exec, $browser"
      "$mod, C, exec, $editor"
      "$mod, M, exec, $music"
      "$mod ALT SHIFT, H, exit" # close hyprland

      # focus window
      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"

      # move window
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, l, movewindow, r"

      # resize window
      "$mod ALT, h, resizeactive, -30 0"
      "$mod ALT, j, resizeactive, 0 30"
      "$mod ALT, k, resizeactive, 0 -30"
      "$mod ALT, l, resizeactive, 30 0"

      # focus workspace
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"

      # move to workspace
      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"

      # screenshots
      "$mod SHIFT, S, exec, hyprshot -m region --clipboard-only -z -s"
      "$mod SHIFT, F, exec, hyprshot -m output --clipboard-only -z -s"
    ];

    # mouse binds
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # multimedia keys
    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      "$mod, XF86MonBrightnessUp, exec, brightnessctl s 120000"
      "$mod, XF86MonBrightnessDown, exec, brightnessctl s 1"
    ];
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pasue"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

  };
}
