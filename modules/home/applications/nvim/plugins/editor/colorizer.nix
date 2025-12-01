{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.colorizer = {
      enable = true;
      settings = {
        user_default_options.names = false;
        names = false;
      };
    };
  };
}
