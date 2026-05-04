{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      system = "x86_64-linux";
      unfreePredicate = import ./nixos/modules/unfree.nix { inherit (nixpkgs) lib; };
      mkHome =
        host:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfreePredicate = unfreePredicate;
          };

          extraSpecialArgs = { inherit host; };

          modules = [ ./home/home.nix ];
        };
    in
    {
      nixosConfigurations.acer = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/hosts/acer/configuration.nix ];
      };

      nixosConfigurations.dell = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/hosts/dell/configuration.nix ];
      };

      homeConfigurations = {
        "lucas@acer" = mkHome {
          name = "acer";
        };

        "lucas@dell" = mkHome {
          name = "dell";
        };
      };
    };
}
