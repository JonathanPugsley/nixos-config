{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.nvim.enable {
    programs.nixvim = {
      plugins.markdown-preview.enable = true;

      keymaps = [
        {
          mode = "n";
          key = "<leader>mp";
          action = ":MarkdownPreviewToggle<CR>";
          options.desc = "Toggle Markdown Preview";
        }
      ];
    };
  };
}
