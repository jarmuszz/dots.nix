inputs:
  let
    overlayFiles = [
      ./niri-scratchpad.nix
    ];

    importOverlay = file: (import file inputs);
  in { nixpkgs.overlays = map importOverlay overlayFiles; }
