{ pkgs, config, ... }: {
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
    
    services.tailscale.enable = true;
  }
}