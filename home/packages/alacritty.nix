{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 14.0;
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
          style = "Medium";
        };
      };
      colors = {
        primary = {
          background = "0x121212";
          foreground = "0xE8E6E3";
        };
        cursor = {
          text = "0x121212";
          cursor = "0xFACC15";
        };
        selection = {
          text = "0xFFF4CC";
          background = "0x2A2A2A";
        };
        normal = {
          black = "0x2A2A2A";
          red = "0xFF7A90";
          green = "0x9CCF8B";
          yellow = "0xFACC15";
          blue = "0x78A9FF";
          magenta = "0xD4A5F9";
          cyan = "0x72D5C8";
          white = "0xC7C7C7";
        };
        bright = {
          black = "0x8A8F98";
          red = "0xFF9AAE";
          green = "0xB9E7A8";
          yellow = "0xFFD54A";
          blue = "0xA9C6FF";
          magenta = "0xE4C1FF";
          cyan = "0x9DE7DD";
          white = "0xFFF4CC";
        };
        indexed_colors = [
          {
            index = 16;
            color = "0xFFB86C";
          }
          {
            index = 17;
            color = "0xFFF4CC";
          }
        ];
      };
      window = {
        decorations = "none";
      };
    };
  };
}
