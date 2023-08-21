{ pkgs, ... }:
let
  riderScript = pkgs.writeShellScriptBin "rider"
    ''
      ${pkgs.steam-run}/bin/steam-run ${pkgs.jetbrains.rider}/bin/rider
    '';
  rider = pkgs.jetbrains.rider.overrideAttrs (oldAttrs: { meta.priority = 10; });
in
{
  imports = [
    ../../home
    ../../home/kitty
    ../../home/firefox
    ../../home/helix
    ../../home/programming
    ../../home/vscode
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
      
      # Need steam-run for Rider Co-pilot.
      steam-run
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