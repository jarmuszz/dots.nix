{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "Go Mono:size=11";
        pad = "5x5";
      };

      scrollback = {
        lines = 5000; # stacktraces :)
      };

      colors-dark = {
        background = "fbf7f0";
        foreground = "000000";

        regular0 = "242424";
        regular1 = "a60000";
        regular2 = "006800";
        regular3 = "6f5500";
        regular4 = "0031a9";
        regular5 = "721045";
        regular6 = "005e8b";

        bright1 = "972500";
        bright2 = "316500";
        bright3 = "884900";
        bright4 = "3548cf";
        bright5 = "8f0075";
        bright6 = "3f578f";
      };

      csd = {
        preferred = "none";
      };
    };
  };
}
