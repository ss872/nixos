{ config, pkgs, ... }:

{
  home.stateVersion = "25.11"; # match your NixOS version

  home.packages = with pkgs; [
    git
    neovim
  ];

  programs.home-manager.enable = true;

  imports = [
    ./modules/git.nix
    ./modules/github.nix
    ./modules/ssh.nix
  ];
}
