{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
