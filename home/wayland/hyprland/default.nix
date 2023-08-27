{ pkgs, inputs, config, ... }: 

let
  # dbus-hyprland-environment = pkgs.writeTextFile {
  #   name = "dbus-hyprland-environment";
  #   destination = "/bin/dbus-hyprland-environment";
  #   executable = true;
  #   text = ''
  #     dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKOP=hyprland
  #     systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  #     systemctl user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  #   '';
  # };
  hyprland-config = import ./config.nix;
in {
  imports = [
    ../core/waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    xwayland.enable = true;
    extraConfig = hyprland-config;
  };
}
