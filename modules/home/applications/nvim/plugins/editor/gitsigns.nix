{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.gitsigns = {
        enable = true;
        settings = {
          # hl-GitSignsCurrentLineBlame = "comment";
          # signs = {} # use defaults
          # signs_staged = {} # use defaults
          signcolumn = true;
          numhl = false;
          linehl = false;
          culhl = false;
          word_diff = false;
          watch_gitdir.follow_files = true;
          auto_attach = true;
          attach_to_untracked = true;
          current_line_blame = true;
          # current_line_blame_opts = {}; # use defaults
          # current_line_blame_formatter = ""; # use defaults
          # preview_config = {}; # used for: ":Gitsigns preview_hunk"
        };
      };
    };
  };
}
