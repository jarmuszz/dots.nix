{ nixvim }:
{
  imports = [
    nixvim.homeModules.nixvim

    ./bash.nix
    ./dirs.nix
    ./eww
    ./foot.nix
    ./gnome.nix
    ./keepassxc.nix
    ./nixvim
    ./portals.nix
    ./ssh-agent.nix
    ./swaync.nix
    ./syncthing.nix
    ./user.nix
    ./waybar
  ];
}
