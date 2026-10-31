{ config, lib, ... }: {
  config = lib.mkIf config.modules.shells.bash.enable {
    programs.bash.enable = true;
  };
}
