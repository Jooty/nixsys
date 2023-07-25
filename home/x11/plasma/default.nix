{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    layout = "us";
    xkbVariant = "";
    desktopManager.plasma5.enable = true;
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

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    konsole
    khelpcenter
    plasma-browser-integration
  ];
}
