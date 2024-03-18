{ pkgs, ... }: 
{ 
  programs.ncmpcpp = { 
    enable = true;
    settings = {
      colors_enabled = false;
    };
  }; 
}
