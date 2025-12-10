{ pkgs, ... }: {
  config = {
    fonts.packages = with pkgs; [
      jetbrains-mono
      liberation_ttf
      mononoki
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
