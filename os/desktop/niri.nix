{ config, lib, pkgs, ... }:

{
  # Niri Wayland compositor.
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [ pkgs.niri ];
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  # Noctalia shell integrations.
  services.upower.enable = lib.mkDefault true;
  services.power-profiles-daemon.enable = lib.mkDefault (!config.services.tuned.enable);
  hardware.bluetooth.enable = lib.mkDefault true;
}
