{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      plugins.gitsigns = {
        enable = true;
        settings = {
          signcolumn = true;
          numhl = false;
          linehl = false;
          culhl = false;
          word_diff = false;
          watch_gitdir.follow_files = true;
          auto_attach = true;
          attach_to_untracked = true;
          current_line_blame = true;
        };
      };
    };
  };
}
