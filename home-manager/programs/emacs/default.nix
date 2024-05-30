{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };

  services.emacs = {
    enable = true;
  };

  # The configuration is changing too fast to make it declarative
  #xdg.configFile."emacs/init.el".source = ./config/init.el;
  #xdg.configFile."emacs/lisp".source = ./config/lisp;
}
