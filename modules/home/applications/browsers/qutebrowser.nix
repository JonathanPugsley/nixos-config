{ config, lib, ... }: {
  options.modules.qutebrowser.enable = lib.mkEnableOption "enable qutebrowser";

  config = lib.mkIf config.modules.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = {
        d = "https://duckduckgo.com/?q={}";
      };
    };
  };
}
