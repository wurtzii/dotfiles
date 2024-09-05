{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, home-manager, ... } 
	@ inputs: let
		inherit (self) outputs;
	in {

		nixosConfigurations.gabriel = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs outputs;};
			modules = [
				./nixos/configuration.nix
			];
		};

		homeConfigurations = {
			"gabriel@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				extraSpecialArgs = {inherit inputs outputs;};

				modules = [ ./home-manager/home.nix ];
			};
		};
	};
}
