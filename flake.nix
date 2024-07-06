{
  description = "Tom's NixOS Flake";

  inputs = {
    # NOTE: Use the `nix flake metadata <flake_url>` command to check if a
    # flake needs nixpkgs.follows defined
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    joshua-flake = {
      url = "github:JManch/nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      username = "tom";
    in
    {
      nixosConfigurations = {
        maximum = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs username;
            hostname = "maximum";
          };
          modules = [
            # this is the same as ./hosts/maximum/default.nix
            ./hosts/maximum
          ];
        };

        homelab = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs username;
            hostname = "homelab";
          };
          modules = [
            ./hosts/homelab
          ];
        };
      };
    };

  # A flake has inputs and outputs
  # Inputs are mostly other flakes, but that can be non-flakes (rare though)
  # Outputs is what your flake produces
  # There is an "output schema" which flakes generally adhere to
}
