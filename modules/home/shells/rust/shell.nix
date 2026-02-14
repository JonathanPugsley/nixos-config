{ pkgs ? import <nixpkgs> {} }:
pkgs.callPackage (
  {
    mkShell,
    rustc,
    cargo,
  }:
  mkShell {
    strictDeps = true;
    nativeBuildInputs = [
      rustc
      cargo
    ];

    shellHook = ''
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    '';
  }
) {}
