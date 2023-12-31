let
    # Hyprland doesn't like the hashtags.
    colors = import ../../theme/colors.nix {};
    border-color = builtins.replaceStrings ["#"] [""] colors.accent;
    inactive-border-color = builtins.replaceStrings ["#"] [""] colors.inactive-accent;
in with colors;
''
    monitor=,preferred,auto,auto
    
    exec-once = swww init
    exec-once = waybar

    input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        sensitivity = -0.5 # -1.0 - 1.0, 0 means no modification.
        force_no_accel = true
    }

    general {
        gaps_in = 6
        gaps_out = 6
        border_size = 2
        col.active_border = rgb(${border-color})
        col.inactive_border = rgb(${inactive-border-color})
        layout = dwindle
    }

    decoration {
        rounding = 8

        #opactity
        inactive_opacity = 1.0
        active_opacity = 1.0
        fullscreen_opacity = 1.0

        #blur
        blur {
            enabled = true
            size = 3
            passes = 3
            new_optimizations = true
        }

        # shadow
        drop_shadow = yes
        shadow_range = 60
        shadow_offset = 0 5
        shadow_render_power = 4
        col.shadow = rgba(00000099)
    }

    animations {
        enabled = yes
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    master {
        new_is_master = true
    }

    gestures {
        workspace_swipe = off
    }

    device:epic mouse V1 {
        sensitivity = -0.5
    }

    #windowrules
    windowrulev2 = noshadow, floating:0
    windowrulev2 = float, title:^(Volume Control)$
    windowrulev2 = float, title:^(Picture in picture)$
    windowrulev2 = float, title:^(Steam)$
    windowrulev2 = float, title:^(Friends List)$
    windowrulev2 = fullscreen, title:^(wlogout)$
    windowrulev2 = float, title:^(wlogout)$

    #binds
    $mainMod = SUPER

    bind = $mainMod, q, exec, kitty
    bind = $mainMod, c, killactive,
    bind = $mainMod, f, togglefloating,
    bind = $mainMod, d, exec, rofi -modi run -show drun
    bind = $mainMod, backspace, exec, btop
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind =, Print, exec, grim -g "$(slurp)" - | swappy -f -
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

''
