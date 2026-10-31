{ config, pkgs, ... }: {
  config = {
    users = {
      mutableUsers = false;

      users.jonny = {
        uid = 1000;
        isNormalUser = true;
        shell = pkgs.zsh;
        hashedPasswordFile = config.sops.secrets."users/jonny/hashedPassword".path;

        extraGroups = [
          "networkmanager"
          "video"
          "wheel"
        ];
      };
    };

    home-manager.users.jonny = { ... }: {
      imports = [ ../../home/default.nix ];

      config.home = {
        username = "jonny";
        homeDirectory = "/home/jonny";
        stateVersion = "25.05"; # do not change
      };
    };
  };
}
