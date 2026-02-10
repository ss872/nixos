{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 13.0;
        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold Italic";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
      };
      window = {
        decorations = "none";
        startup_mode = "Maximized";
      };
    };
  };
}
