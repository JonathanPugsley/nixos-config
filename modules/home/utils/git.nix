{ config, lib, ... }: {
  options.modules.git.enable = lib.mkEnableOption "enable git";

  config = lib.mkIf config.modules.git.enable {
    programs.git = {
      enable = true;
      userName = "Jonny";
      userEmail = "129212089+JonathanPugsley@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
