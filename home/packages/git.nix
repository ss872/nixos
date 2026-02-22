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
      alias = {
        s = "status";
        sw = "switch";
        swn = "switch -c";
        co = "checkout";
        cob = "checkout -b";
        br = "branch";
        branches = "branch -vv";
        aa = "add -A";
        ap = "add -p";
        ci = "commit";
        cm = "commit -m";
        ca = "commit --amend";
        can = "commit --amend --no-edit";
        unstage = "restore --staged --";
        last = "log -1 --stat";
        lg = "log --oneline --graph --decorate --all";
        sync = "!git fetch --prune && git pull --rebase --autostash";
        root = "rev-parse --show-toplevel";
      };
    };
  };
}
