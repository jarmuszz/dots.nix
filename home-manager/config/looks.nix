{ pkgs, ... }:
{

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Greybird";
      package = pkgs.greybird;
    };
    iconTheme = {
      name = "elementary";
      package = pkgs.pantheon.elementary-icon-theme;
    };
    font = {
      name = "Go Regular";
      package = pkgs.go-font;
      size = 12;
    };
  };

  gtk.gtk3.bookmarks = [
    "file:///home/jarmusz/src"
    "file:///home/jarmusz/prj"
    "file:///home/jarmusz/stmp"
    "file:///home/jarmusz/stmp/ss"
    "file:///home/jarmusz/docs"
    "file:///home/jarmusz/Sync"
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };


}
