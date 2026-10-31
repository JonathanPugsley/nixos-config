{ config, lib, ... }: {
  imports = [
    ./stylix.nix
  ];

  options.modules.theming = {
    enable = lib.mkEnableOption "enable system theming";

    stylix.enable = lib.mkEnableOption "stylix system theming";
  };

  config.modules.theming = with config.modules; {
    stylix.enable = lib.mkDefault theming.enable;
  };
}
