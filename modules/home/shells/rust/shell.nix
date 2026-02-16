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
  }
) {}
