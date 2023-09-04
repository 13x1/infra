{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = {self, nixpkgs, nixpkgs-unstable}@inputs: let
        system = "x86_64-linux";
        pkgs = nixpkgs-unstable.legacyPackages.${system};
        util = import ./util.nix;
    in {
        packages.${system} = {

        } //
          util.mapHostAttrs
            (host: "btrfs_setup_${host}")
            (host: import ./hosts/${host}/btrfs_setup.nix { inherit pkgs; });
    };
}
