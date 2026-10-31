{ config, lib, ... }: {
  config = lib.mkIf config.modules.development.tools.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Jonny";
          email = "129212089+JonathanPugsley@users.noreply.github.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
