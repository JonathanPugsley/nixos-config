{ config, lib, ... }: {
  config = lib.mkIf config.modules.utils.btop.enable {
    stylix.targets.btop.enable = false;
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
      };
    };
  };
}
