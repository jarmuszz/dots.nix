{ pkgs, ... }: {
  services.gammastep = {
    enable = true;
    latitude = 51.0;
    longitude = 21.0;
    provider = "manual";
  };
}
