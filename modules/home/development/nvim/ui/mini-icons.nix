{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim.plugins.mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
