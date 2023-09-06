{pkgs, ...}: {
  users.users.makima = {
    isNormalUser = true;
    description = "makima";
    extraGroups = ["networkmanager" "wheel" "libvirtd" "audio" "docker"];
    shell = pkgs.zsh;
  };
}
