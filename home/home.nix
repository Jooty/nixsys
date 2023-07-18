{config, ...}: {
  imports = [
    ./packages.nix
  
    ./modules/helix.nix
    ./modules/firefox.nix
    ./modules/home-manager.nix
    ./modules/kitty.nix
    ./modules/vscode.nix
    
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "openssl-1.1.1u"
      ];
    };
  };

  home = {
    username = "makima";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
  };

  # Nicely reload system units when changing configurations.
  systemd.user.startServices = "sd-switch";

  xdg.enable = true;
  xsession.numlock.enable = true;
}