{ ... }: {
  config = {
    # real-time scheduling
    security.rtkit.enable = true;

    services = {
      # disable pulseaudio
      pulseaudio.enable = false;

      # pipewire
      pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        # wireplumber
        wireplumber.enable = true;
      };
    };
  };
}
