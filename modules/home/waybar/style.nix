{...}: let
  custom = {
    font = "Maple Mono";
    font_size = "12px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    orange_bright = "#FE8019";
    opacity = "1";
    indicator_height = "2px";
  };
in {
  programs.waybar.style = with custom; ''
    * {
      border: none;
      border-radius: 0px;
      padding: 0;
      margin: 0;
      font-family: ${font};
      font-weight: ${font_weight};
      font-size: ${font_size};
    }

    window#waybar {
      background: rgba(28, 28, 28, 0.5);
      border-bottom: 1px solid #928374;
    }

    tooltip {
      background: ${background_1};
      border: 1px solid ${border_color};
    }
    tooltip label {
      margin: 5px;
      color: ${text_color};
    }


    #workspaces button {
      color: ${yellow};
      padding-left:  5px;
      padding-right: 5px;
    }
    #workspaces button.empty {
      color: ${text_color};
    }
    #workspaces button.active {
      color: ${orange_bright};
    }

    #clock {
      color: ${text_color};
    }

    #tray {
      margin-left: 10px;
      color: ${text_color};
    }
    #tray menu {
      background: ${background_1};
      border: 1px solid ${border_color};
      padding: 8px;
    }
    #tray menuitem {
      padding: 1px;
    }

    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 5px;
      color: ${text_color};
    }

    #pulseaudio, #language {
      margin-left: 5px;
    }

    #custom-notification {
      margin-left: 5px;
      padding-right: 2px;
      margin-right: 5px;
    }

    #custom-launcher {
      font-size: 12px;
      color: ${text_color};
      font-weight: bold;
      margin-left: 5px;
      padding-right: 10px;
    }
  '';
}
