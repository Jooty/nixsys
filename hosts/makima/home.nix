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
    ../../home/firefox
    ../../home/programming
    ../../home/x11/plasma/plasma.nix # load plasma apps/configs
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
      discord
      lutris
      # Need steam-run for Rider Co-pilot.
      steam-run
      jetbrains.rider
      github-desktop
      neovim
      obsidian
      spotify
      vlc
      (vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = false;
      })
      latte-dock
      krita
      obs-studio
      droidcam
      vscode-fhs

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
      btop
      cargo
      rustc
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
