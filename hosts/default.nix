inputs: let
  system = "x86_64-linux"
  hyprlandModule = inputs.hyprland.HomeManagerModules.default;
  ironbarModule = inputs.ironbar.HomeManagerModules.default;
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  # Main machine; daily driver
  makima = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./making
      hmModule
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          users.makima = {
            imports = [
              ./makima/home.nix
              hyprlandModule
              ironbarModule
            ];
          };
        };
      }
    ];
  }

  # TODO: Thinkpad
  # TODO: Hezner VPS?
}