{ config, lib, pkgs, ... }: {
  options.modules.gum.enable = lib.mkEnableOption "enable gum";

  config = lib.mkIf config.modules.gum.enable {
    home = {
      packages = [ pkgs.gum ];
      sessionVariables = {
        # choose
        GUM_CHOOSE_CURSOR = "❯ ";
        GUM_CHOOSE_CURSOR_FOREGROUND = "#${config.lib.stylix.colors.base0D}";
        GUM_CHOOSE_HEADER_FOREGROUND = "#${config.lib.stylix.colors.base0B}";
        GUM_CHOOSE_ITEM_FOREGROUND = "#${config.lib.stylix.colors.base05}";
        GUM_CHOOSE_SELECTED_FOREGROUND = "#${config.lib.stylix.colors.base0D}";
        GUM_CHOOSE_SHOW_HELP = false;
      };
    };
  };
}
