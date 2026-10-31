{ lib, ... }: {
  imports = [
    ./playerctl.nix
    ./qpwgraph.nix
    ./wiremix.nix
  ];

  options.modules.audio = {
    enable = lib.mkEnableOption "enable audio";
  };
}
