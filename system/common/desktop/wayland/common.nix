_: {
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "us";
    xkbVariant = "";
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}