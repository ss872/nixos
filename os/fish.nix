{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      g = "git";
      ga = "git add";
      gaa = "git add -A";
      gap = "git add -p";
      gb = "git branch";
      gba = "git branch -a";
      gbd = "git branch -d";
      gcl = "git clone";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gcan = "git commit --amend --no-edit";
      gco = "git checkout";
      gcob = "git checkout -b";
      gd = "git diff";
      gds = "git diff --staged";
      gf = "git fetch --prune";
      gl = "git log --oneline --decorate";
      gla = "git log --oneline --graph --decorate --all";
      gpl = "git pull";
      gm = "git merge";
      gp = "git push";
      gr = "git restore";
      gra = "git remote add";
      grs = "git restore --staged";
      grv = "git remote -v";
      gs = "git status --short";
      gst = "git status";
      gsw = "git switch";
      gswc = "git switch -c";

      nr = "sudo nixos-rebuild switch --flake /home/sshyam/nixos#fw13";
      nrbt = "sudo nixos-rebuild boot --flake /home/sshyam/nixos#fw13";
      nrtt = "sudo nixos-rebuild test --flake /home/sshyam/nixos#fw13";
      nfu = "nix flake update /home/sshyam/nixos";
    };
    interactiveShellInit = ''
      set -g fish_greeting

      function __nixos_rebuild_git --argument-names action
        set -l repo /home/sshyam/nixos
        set -l host fw13

        argparse h/host= -- $argv
        or begin
          echo "usage: nrs|nrb|nrt [--host <name>] <commit message>"
          return 1
        end

        if set -q _flag_host
          set host $_flag_host
        end

        set -l flake "$repo#$host"

        if not contains -- $action switch boot test
          echo "invalid action: $action"
          return 1
        end

        git -C $repo add -A
        or return $status

        if git -C $repo diff --cached --quiet
          echo "No config changes to commit. Rebuilding $host."
        else
          if test (count $argv) -lt 1
            echo "usage: nrs|nrb|nrt [--host <name>] <commit message>"
            return 1
          end

          set -l message (string join " " $argv)
          git -C $repo commit -m "$message"
          or return $status
        end

        sudo nixos-rebuild $action --flake $flake
      end

      function nrs
        __nixos_rebuild_git switch $argv
      end

      function nrb
        __nixos_rebuild_git boot $argv
      end

      function nrt
        __nixos_rebuild_git test $argv
      end
    '';
  };
}
