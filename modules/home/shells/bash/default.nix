{ config, lib, ... }: {
  options.modules.bash.enable = lib.mkEnableOption "enable bash shell";

  config = lib.mkIf config.modules.bash.enable {
    programs.bash = {
      enable = true;

      # variables set for default apps (e.g. terminal emulator, browser, ...)
    };
  };
}
