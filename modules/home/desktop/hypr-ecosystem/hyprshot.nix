{ config, lib, ... }: {
  options.modules.hyprshot.enable = lib.mkEnableOption "enable hyprshot";

  config = lib.mkIf config.modules.hyprshot.enable {
    programs.hyprshot.enable = true;
  };
}
