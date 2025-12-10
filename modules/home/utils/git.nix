{ config, lib, ... }: {
  options.modules.git.enable = lib.mkEnableOption "enable git";

  config = lib.mkIf config.modules.git.enable {
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
