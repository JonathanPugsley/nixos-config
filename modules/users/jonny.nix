{ config, lib, inputs, ... }: {
  config = {
    # user
    users.users.jonny = {
      uid = 1000;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/jonny/hashedPassword".path;
      extraGroups = [
        "networkmanager"
        "video"
        "wheel"
      ];
    };

    # home
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users.jonny = import ../home/default.nix;
    };
  };
}
