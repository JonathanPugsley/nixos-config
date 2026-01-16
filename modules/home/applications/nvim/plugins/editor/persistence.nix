{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.persistence = {
        enable = true;
        autoLoad = true;
        settings.need = 1; # buffers open to allow saving
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>ss";
          action.__raw = "function() require('persistence').select() end";
          options.desc = "Select a session to load";
        }
        {
          mode = "n";
          key = "<leader>sl";
          action.__raw = "function() require('persistence').load({ last = true }) end";
          options.desc = "Load the last session";
        }
        {
          mode = "n";
          key = "<leader>se";
          action.__raw = "function() require('persistence').stop() end";
          options.desc = "Stop Persistence";
        }
      ];
    };
  };
}
