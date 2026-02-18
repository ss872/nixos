# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Shared OS modules.
    ../../os/core.nix
    ../../os/cleanup.nix
    ../../os/locale.nix
    ../../os/networking.nix
    ../../os/desktop/gdm.nix
    ../../os/desktop/gnome.nix
    ../../os/desktop/common.nix
    ../../os/desktop/niri.nix
    ../../os/audio.nix
    ../../os/users.nix
    ../../os/packages.nix
    ../../os/security.nix
    ../../os/localsend-firewall.nix
  ];

  home-manager.users.sshyam = {
    imports = [
      ./home.nix
    ];
  };

  programs.fish.enable = true;
  users.users.sshyam.shell = pkgs.fish;

  networking.hostName = "nixos"; # Define your hostname.

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
