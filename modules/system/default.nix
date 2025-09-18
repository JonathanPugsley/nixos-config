{ ... }: {
  imports = [
    ./applications/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./shells/default.nix
  ];

  config.groups = {
    applications.enable = true;
    core.enable = true;
    desktop.enable = true;
    shells.enable = true;
  };
}
