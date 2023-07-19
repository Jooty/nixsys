{ pkgs, ... }: {
  home.packages = with pkgs; [
    wget
    exa
  ];
}