{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.modules.nixvim.enable { 
    plugins.persistence = {
      enable = true;
      autoLoad = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>qs";
        action.__raw = "function() require('persistence').select() end";
        options.desc = "Select a session to load";
      }
      {
        mode = "n";
        key = "<leader>ql";
        action.__raw = "function() require('persistence').load({ last = true }) end";
        options.desc = "Load the last session";
      }
      {
        mode = "n";
        key = "<leader>qe";
        action.__raw = "function() require('persistence').stop() end";
        options.desc = "Stop Persistence";
      }
    ];
  };
}
