{ pkgs, ... }: {
  home.packages = with pkgs; [
    dotnet-sdk_7
    msbuild
    python3
    nodejs
    gcc
    lua
    cargo
    rustc
  ];
}
