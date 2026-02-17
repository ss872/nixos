{
  # Display manager stack (GDM) for Wayland sessions.
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
}
