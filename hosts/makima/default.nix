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
    kernelParams = [ "intel_iommu=on" ];
    kernelModules = [ "kvm-intel" "v4l2loopback" ];
    initrd = {
      systemd.enable = true;
      availableKernelModules = [ "amdgpu" "vfio-pci" ];
      preDeviceCommands = ''
        DEVS="0000:01:00.0 0000:01:00.1"
        for DEV in $DEVS; do
          echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
        done
        modprobe -i vfio-pci
      '';
    };
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

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemuOvmf = true;
      qemuRunAsRoot = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };
  
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    dconf
    polkit_gnome
    libvirt
    qemu_kvm
    virt-manager
    pinentry-gtk2
    jdk17
    git
    neofetch
    playerctl
    neovim
    partition-manager
    starship
  ];
}
