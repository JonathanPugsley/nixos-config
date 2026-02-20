{ config, lib, osConfig, ... }: {
  options.modules.spotify-player.enable = lib.mkEnableOption "enable spotify-player";

  config = lib.mkIf config.modules.spotify-player.enable {
    programs.spotify-player = {
      enable = true;

      settings = {
        enable_streaming = "DaemonOnly";
        notify_streaming_only = true;
        enable_media_control = true;
        progress_bar_position = "Bottom";
        genre_num = 1;
        enable_mouse_scroll_volume = false;
        device = {
          name = osConfig.networking.hostName;
          device_type = "computer";
          volume = 10;
          autoplay = true;
        };
        layout = {
          playback_window_position = "Bottom";
          playback_window_height = 4;
        };
      };
    };
  };
}
