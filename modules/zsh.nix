{ config, lib, pkgs, ... }:

{
  programs = {
    # ZSH shell & oh-my-zsh
    zsh = {
      enable = true;
      # Enable oh-my-zsh
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "norm"; # Backup if starship doesn't load.
      };
    };

    # Starship
    starship.enable = true;
  };
}
