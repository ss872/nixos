{ config, pkgs, ... }:

{
  home.stateVersion = "25.11"; # match your NixOS version

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    chromium
  ];

  programs.home-manager.enable = true;

  imports = [
    ../../home/packages/git.nix
    ../../home/packages/github.nix
    ../../home/packages/ssh.nix
    ../../home/packages/localsend.nix
    ../../home/packages/neovim.nix
    ../../home/packages/alacritty.nix
    ../../home/packages/fuzzel.nix
    ../../home/packages/swaylock.nix
    ../../home/packages/waybar.nix
    ../../home/packages/niri.nix
  ];
}
