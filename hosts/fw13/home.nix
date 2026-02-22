{ config, pkgs, lib, osConfig ? {}, ... }:

{
  home.stateVersion = "25.11"; # match your NixOS version

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    font-awesome
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
  ] ++ lib.optionals (osConfig.programs.niri.enable or false) [
    ../../home/packages/niri.nix
  ];
}
