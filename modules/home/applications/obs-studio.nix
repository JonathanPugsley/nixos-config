{ config, lib, pkgs, ... }: {
  options.modules.obs.enable = lib.mkEnableOption "enable obs";

  config = lib.mkIf config.modules.obs.enable {
    programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.obs-pipewire-audio-capture ];
    };
  };
}
