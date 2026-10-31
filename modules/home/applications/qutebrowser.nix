{ config, lib, ... }: {
  config = lib.mkIf config.modules.applications.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = {
        d = "https://duckduckgo.com/?q={}";
      };
    };
  };
}
