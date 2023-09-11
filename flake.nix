{
  description = "nixsys";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:mcdonc/plasma-manager/enable-look-and-feel-settings";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, ... } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "nixsys";
      packages = with pkgs; [
        nil
        wget
        neofetch
        nano
        git
        alejandra
        ranger
      ];
    };
    formatter.${system} = pkgs.alejandra;
    deploy = import ./hosts/deploy.nix inputs;
    nixosConfigurations = import ./hosts inputs;
  };
}
