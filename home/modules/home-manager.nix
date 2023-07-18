{lib, ...}: {
  programs.home-manager = {
    enable = true;
    path = lib.mkDefault "$HOME/systems";
  };
}