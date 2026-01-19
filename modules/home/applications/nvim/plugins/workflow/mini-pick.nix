{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.mini-pick = {
        enable = true;
        settings = {
          mappings = {
            choose_in_split = "<C-s>";
            choose_in_vsplit = "<C-v>";
            mark = "<C-x>";
            mark_all = "<C-a>";
            choose_marked = "<C-CR>";
            move_down = "<C-j>";
            move_start = "<C-g>";
            move_up = "<C-k>";
            scroll_down = "<C-f>";
            scroll_up = "<C-b>";
            paste = "<C-p>";
            stop = "<Esc>";
            toggle_info = "<C-Tab>";
            toggle_preview = "<Tab>";
          };

          window = {
            config.__raw = '' function()
              local width = math.floor(0.5 * vim.o.columns)
              local height = math.floor(0.7 * vim.o.lines)
              return {
                anchor = 'NW',
                width = width,
                height = height,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width)),
              }
            end '';
          };
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>f";
          action = ":Pick files<CR>";
          options.desc = "Find Files";
        }
        {
          mode = "n";
          key = "<leader>g";
          action = ":Pick grep_live<CR>";
          options.desc = "Rip Grep Files";
        }
        {
          mode = "n";
          key = "<leader>h";
          action = ":Pick help<CR>";
          options.desc = "Help Pages";
        }
      ];

      highlightOverride = {
        MiniPickBorderText.link = "MiniPickBorder";
      };
    };
  };
}
