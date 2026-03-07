{ pkgs, ... }:

{
  # GNOME desktop.
  services.desktopManager.gnome.enable = true;

  # GNOME Tweaks for advanced desktop customization.
  environment.systemPackages = with pkgs; [
    gnome-tweaks
  ];
}
