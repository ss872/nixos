{ ... }:

{
  # Keep only the latest 10 bootable NixOS generations.
  boot.loader.systemd-boot.configurationLimit = 10;

  # Periodically remove old, unreferenced store paths.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Deduplicate store paths to save disk space.
  nix.optimise.automatic = true;
}
