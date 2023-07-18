_: {
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "us";
    xkbVariant = "";
    displayManager = {
      autoLogin = {
        enable = true;
        user = "makima";
      };
      sddm = {
        enable = true;
        autoNumlock = true;
      };
    };
  };
}
