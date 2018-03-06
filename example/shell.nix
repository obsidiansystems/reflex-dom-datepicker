{ nixpkgs ? import <nixpkgs> {}
, compiler ? "ghcjs"
}:
let
  inherit (nixpkgs) pkgs;

  reflex-platform = import ./reflex-platform.nix;

  drv = import ./. {
    inherit reflex-platform compiler;
  };

in
  if pkgs.lib.inNixShell then drv.env else drv