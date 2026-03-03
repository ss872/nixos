{ config, pkgs, lib, ... }:

{
  home-manager.users.sshyam = {
    home.stateVersion = "25.11"; # match your NixOS version

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      font-awesome
      chromium
      vscodium
      vesktop
      zoom-us
      direnv
      fastfetch
    ];

    programs.home-manager.enable = true;

    dconf.settings = {
      "org/gnome/mutter/wayland" = {
        "xwayland-grab-access-rules" = [ "Wfica" ];
        "xwayland-allow-grabs" = true;
      };
    };

    imports = [
      ../../home/packages/git.nix
      ../../home/packages/github.nix
      ../../home/packages/ssh.nix
      ../../home/packages/localsend.nix
      ../../home/packages/neovim.nix
      ../../home/packages/alacritty.nix
      ../../home/packages/ghostty.nix
    ] ++ lib.optionals (config.programs.niri.enable or false) [
      ../../home/packages/niri.nix
    ];
  };
}
