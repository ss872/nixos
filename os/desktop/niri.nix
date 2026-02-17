{ pkgs, ... }:

{
  # Niri Wayland compositor.
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [ pkgs.niri ];
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
