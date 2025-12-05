{ config, lib, ... }: {
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim.plugins.nvim-surround = {
      enable = true;
      settings.keymaps = {
        insert = "<C-g>s"; # not sure
        insert_line = "<C-g>S"; # not sure
        normal = "ys"; # enter surround mode, end with char
        normal_cur = "yss"; # quick surround line
        normal_line = "yS"; # not sure
        normal_cur_line = "ySS"; # brackets on new lines
        visual = "S"; # enable when in visual mode
        visual_line = "gS";
        delete = "ds";
        change = "cs";
        change_line = "cS";
      };
    };
  };
}
