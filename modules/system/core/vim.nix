{ config, lib, pkgs, ... }: {
  options.modules.vim.enable = lib.mkEnableOption "enable vim";

  config = lib.mkIf config.modules.vim.enable {
    environment.systemPackages = [ pkgs.vim ];
  };
}
