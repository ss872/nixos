{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
  ];

  xdg.configFile."niri" = {
    source = ../system/niri;
    recursive = true;
  };
}
