{ pkgs, ... }: {
  imports = [

  ];

  home.packages = with pkgs; [
    # Apps that are globally installed.
    wget
    git
    neofetch
    nano
  ];
}