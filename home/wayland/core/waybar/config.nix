{ pkgs }:

let
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
in {
  mainBar = {
    layer = "top";
    position = "top";
    height = 18;
    modules-left = [ "wlr/workspaces" ];
    modules-right = ["idle_inhibitor" "cpu" "memory" "tray" "network" "pulseaudio" "clock"];
    # This logo doesn't really work with the .css, although I would like it to. todo.
    "custom/logo" = {
      format = "";
      tooltip = false;
      on-click = "";
    };
    "wlr/workspaces" = {
      format = "{icon}";
      on-click = "activate";
    };
    idle_inhibitor = {
      format = "IDLE: {icon}";
      format-icons = {
        activated = "X";
        deactivated = "O";
      };
    };
    "cpu" = {
      format = "CPU: {usage}%";
    };
    "memory" = {
      format = "MEM: {used:0.1f}/{total:0.1f}";
    };
    "tray" = {
      icon-size = 21;
      spacing = 10;
    };
    pulseaudio = {
      on-click = "${pavucontrol}";
    };
    clock = {
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format = "{:%A, %B %d at %I:%M %p}";
    };
  };
}
