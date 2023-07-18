{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      helix
      git
      wget
      neofetch
      unzip
      openrgb
      wineWowPackages.stable
      vlc
    ];
    variables = {
      EDITOR = "hx";
    };
    sessionVariables = {
      # tada
    };
  };
}
