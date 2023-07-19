{ inputs, pkgs, ...  }: {
  imports = [
    #../waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig = (import ./config.nix {inherit (config);});
  };
}