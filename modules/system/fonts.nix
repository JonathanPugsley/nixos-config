{ config, pkgs, ... }: {
  config = {
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
