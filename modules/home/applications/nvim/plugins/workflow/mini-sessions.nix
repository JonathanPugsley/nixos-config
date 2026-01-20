{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.mini-sessions = {
        enable = true;
        settings = {
          autoread = false;
          autowrite = true;
          verbose = {
            delete = true;
            read = false;
            write = false;
          };
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>ss";
          action.__raw = ''function() MiniSessions.select() end'';
          options.desc = "Load Session...";
        }
        {
          mode = "n";
          key = "<leader>sx";
          action.__raw = ''function() MiniSessions.select("delete") end'';
          options.desc = "Delete Session";
        }
        {
          mode = "n";
          key = "<leader>sw";
          action.__raw = ''function()
            local name = vim.fn.input("Session name: ")
            MiniSessions.write(name)
          end'';
          options.desc = "Write Session";
        }
      ];
    };
  };
}
