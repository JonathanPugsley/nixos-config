{ config, ... }: {
  config.programs.git = {
    enable = true;
    userName = "Jonny";
    userEmail = "129212089+JonathanPugsley@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
