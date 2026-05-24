{ inputs, ... }: 
  (final: prev: {
    niri-scratchpad = inputs.niri-scratchpad-flake.packages.${prev.stdenv.hostPlatform.system}.niri-scratchpad;
  })
