{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.applications.obs.enable {
    programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.obs-pipewire-audio-capture ];
    };
  };
}
