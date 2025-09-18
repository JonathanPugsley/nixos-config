{ config, lib, pkgs, ... }: {
  options.modules.fonts.enable = lib.mkEnableOption "enable fonts";

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      jetbrains-mono
      liberation_ttf
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };
}
