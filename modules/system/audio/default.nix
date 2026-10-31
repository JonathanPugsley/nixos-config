{ lib, ... }: {
  imports = [
    ./pipewire.nix
  ];

  options.modules.audio.enable = lib.mkEnableOption "enable audio";
}
