{ nixvim }:
{
  imports = [
    nixvim.homeModules.nixvim

    ./bash.nix
    ./foot.nix
    ./eww
    ./gnome.nix
    ./syncthing.nix
    ./user.nix
    ./dirs.nix
    ./portals.nix
    ./nixvim
  ];
}
