inputs:
  let
    overlayFiles = [
      ./gram-master.nix
      ./niri-scratchpad.nix
      ./rnote-master.nix
    ];

    importOverlay = file: (import file inputs);
  in { nixpkgs.overlays = map importOverlay overlayFiles; }
