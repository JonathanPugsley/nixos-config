{ config, lib, ... }: {
  imports = [
    ./theme.nix
    ./keybinds.nix
  ];

  options.modules.rofi.enable = lib.mkEnableOption "enable rofi";

  config = lib.mkIf config.modules.rofi.enable {
    stylix.targets.rofi.enable = false;

    # settings
    programs.rofi = {
      enable = true;
      cycle = false;
      location = "center";
      modes = [ "drun" "window" ];
      extraConfig = {
        fixed-num-lines = false;
        disable-history = true;
        sort = false;
        case-sensitive = false;
        scroll-method = 1;
      };
    };
  };
}
