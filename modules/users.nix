{pkgs, ...}: {
  users.users.makima = {
    isNormalUser = true;
    description = "makima";
    extraGroups = ["networkmanager" "wheel" "libvirtd" "audio" "docker" "davfs2"];
    shell = pkgs.zsh;
  };
}
