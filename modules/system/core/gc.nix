{ config, lib, ... }: {
  config = {
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 30d";
      persistent = true;
      randomizedDelaySec = "0";
    };
  };
}
