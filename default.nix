  { pkgs, lib }:

  pkgs.stdenv.mkDerivation rec {
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
