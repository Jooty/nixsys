{ pkgs, inputs, config, ... }: 

{
  imports = [
    ../../modules/greetd.nix
  ];

  environment.systemPackages = with pkgs; [
    wayland
    glib
    grim
    picom
    slurp
    swappy
    wl-clipboard
    wlogout
    wlr-randr
    swayidle
    swaylock-effects
    swww
    pulseaudio
    rofi
    hyprpicker
    pavucontrol
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    WLR_DRM_NO_ATOMIC = "1";
    XDG_SESSION_TYPE = "wayland";
    __GLX_VENDOR_LIBRARY_TYPE = "nvidia";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    TERMINAl = "kitty";
  };
}
