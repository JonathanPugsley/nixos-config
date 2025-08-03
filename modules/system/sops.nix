{ config, ... }: {
  config.sops = {
    defaultSopsFile = ../../sops/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/root/.config/sops/age/keys.txt";
    secrets."users/jonny/hashedPassword".neededForUsers = true;
  };
}
