let
  colors = import ../../../theme/colors.nix {};
in with colors; ''
* {
    border: none;
    border-radius: 0px;
    font-family: "FiraCode";
    font-size: 14px;
    min-height: 0;
    color: ${fg};
}

window#waybar {
    background: ${bg};
}

#window {
    padding: 0px 5px;
    font-size:0.8em;
}

#workspaces, #clock, #custom-music, #window { 
    font-weight: 800;
}

#tray * {
    color: ${bg};
}

/* Workspace Buttons */
#workspaces button label{
    color: ${accent};
}
#workspaces button.focused label {
    color: ${bg};
}
#workspaces button.focused {
    background: ${fg}; 
}

#mode {
    background-color: ${fg};
    color: white;
}

#clock, #battery, #cpu, #memory, #network, #pulseaudio, #tray, #mode, #idle_inhibitor {
    padding: 0 5px;
    margin: 0 5px;
}

#custom-music {
    color: ${accent};
    font-size:0.8em;
    padding: 0 20px;
}

#custom-worktime {
    padding: 0 5px;
}

#clock {
    margin: 0;
    color: ${accent};
}

#network.disconnected {
    color: ${fg};
}

#pulseaudio.muted {
    color: ${fg};
}
''
