{ pkgs, ... }: {
  imports = [
    #./firefox
    #./helix
  ];

  home.packages = with pkgs; [
    wget
    git
  ];
}