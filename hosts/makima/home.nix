{ pkgs, ... }: {
  systemd.user.startServices = "sd.switch";
  programs.home-manager.enable = true;

  home = {
    username = "jay";
    homeDirectory = "home/jay";
    packages = with pkgs; [
      discord
      unzip
      vlc
      gimp
      playerctl
      wine
      github-desktop
      obsidian
      spotify
    ];

    stateVersion = "23.05";
  };
}