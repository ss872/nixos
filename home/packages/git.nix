{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.email = "Shyamal Shah";
      user.name = "shah.shyamal.872@gmail.com";
      init.defaultBranch = "main";
      fetch.prune = true;
      push.autoSetupRemote = true;
      pull.rebase = false;
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
    };
  };
}
