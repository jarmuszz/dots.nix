{ nixpkgs-master, arch, ... }: 
    final: prev: {
      rnote = nixpkgs-master.legacyPackages.${arch}.rnote;
    }
