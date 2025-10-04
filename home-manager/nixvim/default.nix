{
  programs.nixvim = (import ./conf) // {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };
}
