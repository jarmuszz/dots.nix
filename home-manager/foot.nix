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

      colors = {
        background="ffffff";
        foreground="000000";

        regular0="242424";  # black
        regular1="f62b5a";  # red
        regular2="00aa00";  # green
        regular3="f68a2b";  # yellow
        regular4="6877ff";  # blue
        regular5="cb4dd9";  # magenta
        regular6="0094ab";  # cyan

        bright0="242424";  # black
        bright1="f62b5a";  # red
        bright2="00aa00";  # green
        bright3="e3c401";  # yellow
        bright4="6877ff";  # blue
        bright5="cb4dd9";  # magenta
        bright6="0094ab";  # cyan
      };

      csd = {
        preferred = "none";
      };
    }; 
  };
}
