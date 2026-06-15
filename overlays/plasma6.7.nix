{ inputs, ... }: 
  (final: prev: {
    kdePackages = inputs.nixpkgs-master.legacyPackages.${prev.stdenv.hostPlatform.system}.kdePackages;
  })
