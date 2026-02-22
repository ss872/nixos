{ pkgs, inputs, ... }:

{
  imports = [
    ./fuzzel.nix
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
  ];

  programs.noctalia-shell.enable = true;

  xdg.configFile."niri" = {
    source = ../.config/niri;
    recursive = true;
  };
}
