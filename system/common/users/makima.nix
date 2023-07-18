{pkgs, ...}: {
  # Configure the shell for this user.
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "norm";
    };
  };
  
  services.getty.autologinUser = "makima";
  security.sudo.wheelNeedsPassword = false;
  users.users.makima = {
    isNormalUser = true;
    description = "makima";
    extraGroups = ["networkmanager" "wheel" "libvirtd" "audio" "docker"];
    shell = pkgs.zsh;
  };
}
