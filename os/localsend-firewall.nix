{ config, pkgs, ... }:

{
  # LocalSend: discovery (UDP) + transfer (TCP) use port 53317
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
}
