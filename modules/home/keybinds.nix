{ config, ... }: {
  config.wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    #"$top" = "$terminal -e btop";
    #"$editor" = "nvim";
    #"$fileManager" = "$terminal -e $termFileManager $HOME";
    #"$lock" = "hyprlock";
    "$menu" = "wofi";
    #"$music" = "spotify-launcher";
    #"$notes" = "obsidian";
    #"$termFileManager" = "yazi";
    "$terminal" = "alacritty";

    bind = [
      "$mod, Q, killactive,"
      #"$mod, E, exec, $fileManager"
      "$mod, R, exec, $menu"
      "$mod, RETURN, exec, $terminal"

      "$mod, F, fullscreen"
      "$mod, G, togglefloating"

      #"$mod, X, exec, $browser"

      "$mod ALT SHIFT, H, exit"

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
      
    ];
  };
}
