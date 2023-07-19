_: {
  services.picom = {
    enable = true;
    experimentalBackends = true;
    backend = "glx";
    vSync = true;

    # Transparency
    inactiveOpacity = 0.8;
    activeOpacity = 0.95;
    opacityRules = [
      "100:class_g   *? 'Firefox'"
      "100:class_g   *? 'Rofi'"
    ];

    fade = true;
    fadeDelta = 10;

    shadow = true;

    settings = {
      blur-method = "dual_kawase";
      blur-strength = 8;
      blue-background-exclude = [ "class_g = 'eww-topbar-btw'" ];

      corner-radius = 10;
      round-borders = 1;
    };
  }
}