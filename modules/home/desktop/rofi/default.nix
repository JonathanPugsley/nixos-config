{ config, lib, pkgs, ... }: {
  imports = [
    ./theme.nix
    ./keybinds.nix
  ];

  config = lib.mkIf config.modules.desktop.rofi.enable {
    stylix.targets.rofi.enable = false;

    # settings
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-emoji
        rofi-nerdy
      ];
      settings = {
        cycle = false;
        location = 0;
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
  };
}
