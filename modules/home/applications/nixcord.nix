{ config, lib, ... }: {
  config = lib.mkIf config.modules.applications.nixcord.enable {
    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;
    };
  };
}
