{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable {
    plugins.which-key.enable = true;
  };
}
