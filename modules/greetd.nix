_: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "jay";
      };
      default_session = initial_session;
    };
  };
}