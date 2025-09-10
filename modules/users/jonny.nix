{ config, pkgs, lib, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  config = {
    users.users.jonny = {
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

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      sharedModules = [ inputs.nixcord.homeModules.nixcord ];
      users.jonny = { pkgs, ... }: {
        imports = [ ../home/default.nix ];
        programs.home-manager.enable = true;
        home = {
          username = "jonny";
          homeDirectory = "/home/jonny";
          stateVersion = "25.05"; # do not change
        };
      };
    };
  };
}
