{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 26;
        output = [
          "eDP-1"
        ];

        modules-left = [ "custom/logo" "custom/playerctl" "tray" ];
        modules-center = [ "sway/workspaces" "wlr/workspaces" ];
        modules-right = [ "battery" "pulseaudio" "backlight" "network" "clock" ];

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = "";
        };

        "custom/playerctl" = {
          format = "{icon}  <span>{}</span>";
          return-type = "json";
          max-length = 35;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} ~ {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          format-icons = {
            Playing = "<span foreground='#94e2d5'></span>";
            Paused = "<span foreground='#f38ba8'></span>";
          };
        };

        "tray" = {
          icon-size = 21;
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
      };
    };
  };
}