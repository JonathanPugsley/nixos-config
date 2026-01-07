{ pkgs, ... }: {
  config = {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
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
