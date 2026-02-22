{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16.0;
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
      };
      colors = {
        primary = {
          background = "0x1E1D2F";
          foreground = "0xD9E0EE";
        };
        cursor = {
          text = "0x1E1D2F";
          cursor = "0xF5E0DC";
        };
        normal = {
          black = "0x6E6C7E";
          red = "0xF28FAD";
          green = "0xABE9B3";
          yellow = "0xFAE3B0";
          blue = "0x96CDFB";
          magenta = "0xF5C2E7";
          cyan = "0x89DCEB";
          white = "0xD9E0EE";
        };
        bright = {
          black = "0x988BA2";
          red = "0xF28FAD";
          green = "0xABE9B3";
          yellow = "0xFAE3B0";
          blue = "0x96CDFB";
          magenta = "0xF5C2E7";
          cyan = "0x89DCEB";
          white = "0xD9E0EE";
        };
        indexed_colors = [
          {
            index = 16;
            color = "0xF8BD96";
          }
          {
            index = 17;
            color = "0xF5E0DC";
          }
        ];
      };
      window = {
        decorations = "none";
        startup_mode = "Maximized";
      };
    };
  };
}
