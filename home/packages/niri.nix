{ pkgs, ... }:

{
  imports = [
    ./walker.nix
    ./waybar.nix
    ./swaylock.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
  ];

  xdg.configFile."niri" = {
    source = ../.config/niri;
    recursive = true;
  };
}
