{ inputs, ... }: 
  (final: prev: {
    gram = inputs.nixpkgs-master.legacyPackages.${prev.stdenv.hostPlatform.system}.gram;
  })
