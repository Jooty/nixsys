{ pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    flameshot
    gimp
    github-desktop
    jetbrains.rider
    obsidian
    playerctl
    spotify
    steam
  ];
}