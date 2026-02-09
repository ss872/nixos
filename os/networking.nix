{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall defaults
  networking.firewall.enable = true;
}
