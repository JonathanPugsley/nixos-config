{ config, lib, ... }: {
  options.modules.btop.enable = lib.mkEnableOption "enable btop";

  config = lib.mkIf config.modules.btop.enable {
    programs.btop = {
      enable = true;
      # settings = {
      #   color_theme = "TTY";
      #   theme_background = false;
      # };
    };
  };
}
