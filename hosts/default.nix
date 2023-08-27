inputs: let
  system = "x86_64-linux";
  hmModule = inputs.home-manager.nixosModules.home-manager;
  hyprlandModule = inputs.hyprland.homeManagerModules.default;
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  # Main machine; daily driver
  makima = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./makima
      #hyprlandModule
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.makima = {
            imports = [
              ./makima/home.nix
            ];
          };
        };
      }
    ];
  };
}