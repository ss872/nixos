{ config, pkgs, ... }:

{
  # Display manager stack (GDM) for Wayland sessions.
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  # GNOME desktop.
  services.desktopManager.gnome.enable = true;

  # Niri Wayland compositor.
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [ pkgs.niri ];
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  # Configure keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
