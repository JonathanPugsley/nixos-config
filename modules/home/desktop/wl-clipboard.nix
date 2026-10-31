{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.modules.desktop.wl-clipboard.enable {
    home.packages = [
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
    ];

    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
