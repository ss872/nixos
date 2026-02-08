{ config, pkgs, ... }:

{
  home.stateVersion = "25.11"; # match your NixOS version

  home.packages = with pkgs; [
    neovim
    localsend
  ];

  programs.home-manager.enable = true;

  imports = [
    ../../home/modules/git.nix
    ../../home/modules/github.nix
    ../../home/modules/ssh.nix
  ];
}
