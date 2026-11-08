{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      libs = with pkgs; [btrfs-progs.lib btrfs-progs.dev];

      # btrfs-asdf = pkgs.sbcl.buildASDFSystem {
      #   pname = "btrfs";
      #   version = "0.0.1";

      #   src = ./libs/btrfs;

      #   systems = ["btrfs"];

      #   lispLibs = with pkgs.sbcl.pkgs; [
      #     cffi
      #     cffi-grovel
      #     cffi-toolchain
      #   ];
      # };

      # sbcl' = (pkgs.sbcl.withOverrides (self: super: {"btrfs" = btrfs-asdf;}))
      #   .withPackages (ps: [
      #   ps."btrfs"
      # ]);
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          btrfs-progs
          # sbcl'
          sbcl
        ];

        shellHook = ''
          export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libs}:$LD_LIBRARY_PATH
        '';
      };
    });
}
