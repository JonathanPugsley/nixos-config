{ config, lib, pkgs, ... }: {
  options.modules.wl-clipboard.enable = lib.mkEnableOption "enable wl-clipboard";

  config = lib.mkIf config.modules.wl-clipboard.enable {
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
