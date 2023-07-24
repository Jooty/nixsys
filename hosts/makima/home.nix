{ pkgs, ... }: {
  imports = [
    ../../home
    ../../home/kitty
    ../../home/firefox
    ../../home/helix
    ../../home/rofi
    ../../home/programming
    ../../home/vscode
    ../../home/wayland/hyprland
    ../../modules/swayidle.nix
  ];

  #systemd.user.startServices = "sd.switch";
  programs.home-manager.enable = true;

  home = {
    username = "makima";
    homeDirectory = "/home/makima";
    packages = with pkgs; [
      flameshot
      wineWowPackages.stable
      winetricks
      discord
      
      jetbrains.rider
      github-desktop
      gh

      unzip
      playerctl
      obsidian
      spotify
      exa
      pywal
      lutris
    ];

    stateVersion = "23.05";
  };
}