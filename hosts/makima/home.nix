{ pkgs, lib, ... }:
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
    ../../home/programming

    # Load this when you want to be on wayland/hyprland
    # ../../home/wayland/hyprland

    # Load this when you want to be on x11/KDE Plasma
    ../../home/x11
    ../../home/x11/plasma/plasma.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "makima";
    homeDirectory = "/home/makima";
    packages = with pkgs; [
      # apps
      # Need steam-run for Rider Co-pilot.
      steam-run
      jetbrains.rider
      github-desktop
      neovim
      obsidian
      spotify
      #nur.repos.nltch.spotify-adblock
      vlc
      latte-dock
      krita
      obs-studio
      droidcam
      vscode-fhs
      qbittorrent
      protonvpn-gui
      (vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = false;
      })
      nextcloud-client

      # tools
      gh
      unzip
      exa
      pywal
      ripgrep
      lazygit
      btop
      tmux
    ];

    # symlink the zsh config
    file.".zshrc" = {
      source = ../../config/.zshrc;
      recursive = true;
      executable = true;
    };

    # symlink the starship.toml config
    file."starship.toml" = {
      source = ../../config/starship.toml;
      recursive = true;
      executable = true;
    };

    stateVersion = "23.05";
  };
}
