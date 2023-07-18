{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./common/boot.nix

      ./common/locale.nix
      ./common/environment.nix
      ./common/sound.nix

      ./common/desktop/xserver/plasma.nix

      ./common/users/makima.nix
    ];

  # Networking
  networking.hostName = "makimanix";
  networking.networkmanager.enable = true;

  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    package = pkgs.nixFlakes;
  };

  # Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode"];})
    material-icons
  ];

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # NVIDIA drivers
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
  };

  system.stateVersion = "23.05";
}
