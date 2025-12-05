{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim.plugins.colorizer = {
      enable = true;
      settings = {
        user_default_options.names = false;
        names = false;
      };
    };
  };
}
