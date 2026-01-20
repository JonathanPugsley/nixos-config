{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.mini-icons = {
        enable = true;
        mockDevIcons = true;
      };
    };
  };
}
