{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sshyam = {
    isNormalUser = true;
    description = "Shyamal";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
