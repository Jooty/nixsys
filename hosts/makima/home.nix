{ pkgs, ... }: {
  imports = [
    ../../home
    ../../home/rofi
    #../../home/programming
    #../../home/vscode
    ../../modules/swayidle.nix
  ];

  #systemd.user.startServices = "sd.switch";
  programs.home-manager.enable = true;

  home = {
    username = "makima";
    homeDirectory = "/home/makima";
    packages = with pkgs; [
      firefox
      discord
      unzip
      helix
      vlc
      gimp
      playerctl
      wine
      github-desktop
      obsidian
      spotify
      kitty
      exa
    ];

    stateVersion = "23.05";
  };
}