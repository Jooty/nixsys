let
  kitty-config = import ./settings.nix;
in {
  programs.kitty = {
    enable = true;
    extraConfig = kitty-config;
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      cursor_shape = "underline";
      cursor_underline_thickness = "0.5";
    };
    font = {
      name = "FiraCode";
      size = 10;
    };
  };
}
