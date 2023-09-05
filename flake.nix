{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = {self, nixpkgs, nixpkgs-unstable}@inputs: let
        system = "x86_64-linux";
        util = import ./util.nix;
        pkgs = import nixpkgs-unstable {inherit system; overlays = [util]; };
    in {
        packages.${system} = {
            fs_cli = pkgs.callPackage ./fs/cli.nix {};
        };
    };
}
