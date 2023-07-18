_: {
  imports = [
    ./common.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    nvidiaPatches = true;
  };
}