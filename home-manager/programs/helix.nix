{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "everforest_dark";
      editor = {
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        mouse = true;

        lsp = {
          display-messages = true;
          display-inlay-hints = false;
        };

        indent-guides = {
          render = true;
          character = "┊";
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
