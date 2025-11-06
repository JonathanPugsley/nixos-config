{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.trouble.enable = true;
  };
}
