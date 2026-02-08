{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    # Stop home-manager from injecting implicit defaults
    enableDefaultConfig = false;

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
        addKeysToAgent = "yes";
      };
    };
  };
}
