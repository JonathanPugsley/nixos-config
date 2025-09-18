{ config, lib, inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options.modules.sops.enable = lib.mkEnableOption "enable sops";

  config.sops = lib.mkIf config.modules.sops.enable {
    defaultSopsFile = ../../../sops/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/root/.config/sops/age/keys.txt";
    secrets."users/jonny/hashedPassword".neededForUsers = true;
  };
}
