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
    ../../home/wayland/hyprland
    ../../home/kitty
    ../../home/firefox
    ../../home/programming
    ../../home/vscode
  ];

  #systemd.user.startServices = "sd.switch";
  programs.home-manager.enable = true;

  home = {
    username = "makima";
    homeDirectory = "/home/makima";
    packages = with pkgs; [
      # apps
      flameshot
      wineWowPackages.stable
      winetricks
      webcord-vencord
      # Need steam-run for Rider Co-pilot.
      steam-run
      jetbrains.rider
      github-desktop
      neovim
      obsidian
      spotify
      vlc

      # tools
      gh
      unzip
      exa
      pywal
      python3
      nodejs
      ripgrep
      gcc
      lua
      lazygit
    ];

    # symlink the .zshrc config
    file.".zshrc" = {
      source = ../../config/.zshrc;
      recursive = true;
      executable = true;
    };

    stateVersion = "23.05";
  };
}
