{ config, pkgs, ... }:

{
  home.stateVersion = "25.11"; # match your NixOS version

  home.packages = with pkgs; [ ];

  programs.home-manager.enable = true;

  imports = [
    ../../home/packages/git.nix
    ../../home/packages/github.nix
    ../../home/packages/ssh.nix
    ../../home/packages/localsend.nix
    ../../home/packages/neovim.nix

  ];
}
