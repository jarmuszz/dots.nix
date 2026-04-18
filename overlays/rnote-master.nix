{ inputs, ... }: 
  (final: prev: {
    rnote = inputs.nixpkgs-master.legacyPackages.${prev.stdenv.hostPlatform.system}.rnote;
  })
