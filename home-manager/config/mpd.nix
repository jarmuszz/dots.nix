{
  services.mpd = {
    enable = true;
    extraConfig =
      "	audio_output {\n		type \"pipewire\"\n		name \"My PipeWire Output\"\n	}\n";
  };

  services.mpd-mpris.enable = true;
}
