{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "noctalia-amber";
      "font-family" = "JetBrainsMono Nerd Font Mono";
      "font-size" = 14;
      "window-decoration" = "none";
      "background-opacity" = 0.95;
      "window-padding-x" = 14;
      "window-padding-y" = 12;
    };

    themes.noctalia-amber = {
      background = "121212";
      foreground = "e8e6e3";
      "cursor-color" = "facc15";
      "selection-background" = "2a2a2a";
      "selection-foreground" = "fff4cc";
      palette = [
        "0=#2a2a2a"
        "1=#ff7a90"
        "2=#9ccf8b"
        "3=#facc15"
        "4=#78a9ff"
        "5=#d4a5f9"
        "6=#72d5c8"
        "7=#c7c7c7"
        "8=#8a8f98"
        "9=#ff9aae"
        "10=#b9e7a8"
        "11=#ffd54a"
        "12=#a9c6ff"
        "13=#e4c1ff"
        "14=#9de7dd"
        "15=#fff4cc"
        "16=#ffb86c"
        "17=#fff4cc"
      ];
    };
  };
}
