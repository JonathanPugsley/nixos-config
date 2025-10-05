{ config, lib, ... }: {
  options.modules.ripgrep.enable = lib.mkEnableOption "enable ripgrep";

  config.programs.ripgrep = lib.mkIf config.modules.ripgrep.enable {
    enable = true;
  };
}
