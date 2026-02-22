{ config, pkgs, inputs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Citrix Workspace Stuff.
  nixpkgs.config.citrix_workspace = {
    sha256 = "06hdwi5rd8z43nlpvym6yrw3snfz8jh6ic3g4pihn9ji22bw5pbd";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  services.fwupd.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
}
