{ config, pkgs, ... }:

{
  # Fingerprint stuff
  services.fprintd.enable = true;

  # security.pam.services.login.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;
  security.pam.services.polkit-1.fprintAuth = true;
  services.dbus.enable = true;

  environment.variables.SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
}
