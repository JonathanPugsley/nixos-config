{ config, lib, pkgs, ... }: {
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
      plugins = with pkgs; [
        rofi-emoji
        rofi-nerdy
      ];
      cycle = false;
      location = "center";
      modes = [ "drun" "window" "nerdy" "emoji" ];
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
