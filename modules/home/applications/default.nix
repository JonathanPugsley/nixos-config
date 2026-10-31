{ config, lib, ... }: {
  imports = [
    ./davinci-resolve.nix
    ./libreoffice.nix
    ./librewolf.nix
    ./nixcord.nix
    ./obs-studio.nix
    ./qmk.nix
    ./qutebrowser.nix
    ./spotify.nix
  ];

  options.modules.applications = {
    enable = lib.mkEnableOption "enable applications";

    librewolf.enable = lib.mkEnableOption "librewolf browser";
    qutebrowser.enable = lib.mkEnableOption "qutebrowser";
    davinci.enable = lib.mkEnableOption "davinci video editor";
    libreoffice.enable = lib.mkEnableOption "libreoffice suite";
    nixcord.enable = lib.mkEnableOption "nix discord client";
    obs.enable = lib.mkEnableOption "obs screen capture";
    qmk.enable = lib.mkEnableOption "qmk";
    spotify.enable = lib.mkEnableOption "spotify music streaming";

  };

  config.modules.applications = with config.modules; {
    librewolf.enable = lib.mkDefault applications.enable;
    qutebrowser.enable = lib.mkDefault applications.enable;
    davinci.enable = lib.mkDefault applications.enable;
    libreoffice.enable = lib.mkDefault applications.enable;
    nixcord.enable = lib.mkDefault applications.enable;
    obs.enable = lib.mkDefault applications.enable;
    qmk.enable = lib.mkDefault applications.enable;
    spotify.enable = lib.mkDefault applications.enable;
  };
}
