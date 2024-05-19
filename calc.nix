let
  pkgs = import <nixpkgs> { };
in
  pkgs.stdenv.mkDerivation {
    name = "hole-calc";
    
    buildInputs = [
      pkgs.nasm
    ];

    src = ./.;

    buildPhase = ''
      make asm
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp calc  $out/bin/hole-calc
    '';
  }
