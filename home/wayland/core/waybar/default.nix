{ pkgs, config, ... }:

let
  waybar_config = import ./config.nix { inherit pkgs; };
  waybar_style = import ./style.nix;
in {
  programs.waybar = {
    enable = true;
    settings = waybar_config;
    style = waybar_style;
  };
}
