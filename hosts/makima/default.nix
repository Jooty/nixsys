{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ../../modules
      ../../modules/zsh.nix
      ../../home/x11/plasma
  ];

  # Booting
  boot = {
    kernelParams = ["quiet"];
    initrd.systemd.enable = true;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 8;
        consoleMode = "max"; # Select the highest resolution for the bootloader.
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };

    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback.out];
    kernelModules = ["v4l2loopback" "kvm-intel"];
  };

  # Networking
  networking.hostName = "makima";
   
  services.pcscd.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  services.getty.autologinUser = "makima";
  security.sudo.wheelNeedsPassword = false;

  programs= {
    steam = {
      enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  hardware = {
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
  
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    dconf
    polkit_gnome
    libvirt
    qemu_kvm
    pinentry-gtk2
    jdk17
    git
    neofetch
    playerctl
    neovim
  ];
}
