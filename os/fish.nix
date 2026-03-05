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
    };
    interactiveShellInit = ''
      set -g fish_greeting

      function __prompt_git_action
        set -l git_dir (command git rev-parse --git-dir 2>/dev/null)
        or return

        if test -d "$git_dir/rebase-merge"
          echo "REBASING"
        else if test -d "$git_dir/rebase-apply"
          echo "APPLYING"
        else if test -f "$git_dir/MERGE_HEAD"
          echo "MERGING"
        else if test -f "$git_dir/CHERRY_PICK_HEAD"
          echo "CHERRY-PICK"
        else if test -f "$git_dir/REVERT_HEAD"
          echo "REVERTING"
        else if test -f "$git_dir/BISECT_LOG"
          echo "BISECT"
        end
      end

      function __prompt_git_summary
        command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        or return

        set -l branch (command git symbolic-ref --quiet --short HEAD 2>/dev/null)
        if test -z "$branch"
          set branch (command git rev-parse --short HEAD 2>/dev/null)
        end

        set -l staged 0
        set -l unstaged 0
        set -l untracked 0

        for line in (command git status --porcelain 2>/dev/null)
          set -l x (string sub -s 1 -l 1 -- $line)
          set -l y (string sub -s 2 -l 1 -- $line)

          if test "$x$y" = "??"
            set untracked (math $untracked + 1)
            continue
          end

          if test "$x" != " "
            set staged (math $staged + 1)
          end
          if test "$y" != " "
            set unstaged (math $unstaged + 1)
          end
        end

        set -l parts $branch

        if test $staged -gt 0
          set parts $parts "+$staged"
        end
        if test $unstaged -gt 0
          set parts $parts "~$unstaged"
        end
        if test $untracked -gt 0
          set parts $parts "?$untracked"
        end

        if command git rev-parse --verify --quiet refs/stash >/dev/null 2>&1
          set parts $parts "stash"
        end

        set -l upstream_counts (
          command git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null \
            | string replace -a \t " " \
            | string split -n " "
        )
        if test (count $upstream_counts) -eq 2
          set -l behind $upstream_counts[1]
          set -l ahead $upstream_counts[2]

          if test $ahead -gt 0
            set parts $parts ">$ahead"
          end
          if test $behind -gt 0
            set parts $parts "<$behind"
          end
        end

        set -l action (__prompt_git_action)
        if test -n "$action"
          set parts $parts "$action"
        end

        string join " " $parts
      end

      function __prompt_format_duration --argument-names ms
        if test -z "$ms"
          return
        end

        if test "$ms" -le 0
          return
        end

        if test "$ms" -lt 1000
          echo "$ms ms"
          return
        end

        set -l sec (math -s0 "$ms / 1000")
        if test "$sec" -lt 60
          echo "$sec s"
          return
        end

        set -l min (math -s0 "$sec / 60")
        set -l rem (math -s0 "$sec % 60")
        echo "$min m $rem s"
      end

      function fish_prompt
        set -l last_status $status
        set -l cwd (string replace -r "^$HOME" "~" -- $PWD)
        set -l git_info (__prompt_git_summary)

        if test $last_status -ne 0
          printf "%s[%s]%s " \
            (set_color red) \
            $last_status \
            (set_color normal)
        end

        printf "%s%s%s" \
          (set_color brcyan) \
          $cwd \
          (set_color normal)

        if test -n "$git_info"
          printf " %s[%s]%s" \
            (set_color magenta) \
            $git_info \
            (set_color normal)
        end

        printf "\n%s> %s" \
          (set_color bryellow) \
          (set_color normal)
      end

      function fish_right_prompt
        set -l duration (__prompt_format_duration $CMD_DURATION)
        set -l now (date "+%H:%M")

        if test -n "$duration"
          printf "%s%s | %s%s" \
            (set_color brblack) \
            $duration \
            $now \
            (set_color normal)
        else
          printf "%s%s%s" \
            (set_color brblack) \
            $now \
            (set_color normal)
        end
      end

      function __nixos_flake_target
        set -l repo /home/sshyam/nixos
        set -l host fw13

        argparse h/host= -- $argv
        or begin
          echo "usage: [command] [--host <name>]"
          return 1
        end

        if set -q _flag_host
          set host $_flag_host
        end

        echo "$repo#$host"
      end

      function __nixos_rebuild_git --argument-names action
        set -l repo /home/sshyam/nixos
        set -l flake (__nixos_flake_target $argv)
        or begin
          echo "usage: nrs|nrb|nrt [--host <name>] <commit message>"
          return 1
        end
        set -l host (string split "#" $flake)[2]

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

      function nr
        set -l flake (__nixos_flake_target $argv)
        or begin
          echo "usage: nr [--host <name>]"
          return 1
        end

        sudo nixos-rebuild switch --flake $flake
      end

      function nrbt
        set -l flake (__nixos_flake_target $argv)
        or begin
          echo "usage: nrbt [--host <name>]"
          return 1
        end

        sudo nixos-rebuild boot --flake $flake
      end

      function nrtt
        set -l flake (__nixos_flake_target $argv)
        or begin
          echo "usage: nrtt [--host <name>]"
          return 1
        end

        sudo nixos-rebuild test --flake $flake
      end

      function nfu
        set -l repo /home/sshyam/nixos

        if test (count $argv) -eq 0
          nix flake update --flake $repo
        else
          nix flake update --flake $repo $argv
        end
      end
    '';
  };
}
