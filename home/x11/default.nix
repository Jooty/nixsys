{ pkgs, inputs, config, ... }: 

{
  imports = [
  ];

  home.packages = with pkgs; [
    discord
    flameshot
    latte-dock
  ];
}
