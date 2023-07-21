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
      discord
      unzip
      playerctl
      gh
      obsidian
      spotify
      exa
      pywal
      lutris
      wine
      github-desktop
    ];

    stateVersion = "23.05";
  };
}