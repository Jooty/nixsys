inputs: let
  system = "x86_64-linux";
  hmModule = inputs.home-manager.nixosModules.home-manager;
  plasmaManager = inputs.plasma-manager.homeManagerModules.plasma-manager;
  nur = inputs.nur;
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  # Main machine; daily driver
  makima = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./makima
      nur.nixosModules.nur
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.makima = {
            # Confusing line. Tell nixpkgs to override the 'nur' keyword with the tarball
            # we source in our flake. Then, inherit the regular pkgs.
            nixpkgs.config.packageOverrides = pkgs: {
              nur = nur { inherit pkgs; };
            };

            imports = [
              ./makima/home.nix
              plasmaManager
            ];
          };
        };
      }
    ];
  };
}
