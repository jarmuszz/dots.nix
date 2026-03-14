{ config, ... }:
{
  xdg.userDirs =
    let
      inHome = (path: "${config.home.homeDirectory}/${path}");
    in
    {
      enable = true;
      documents = inHome "docs";
      desktop = inHome "stmp";
      download = inHome "dls";
      music = inHome "music";
      pictures = inHome "other/pics";
      videos = inHome "other/videos";
    };
}
