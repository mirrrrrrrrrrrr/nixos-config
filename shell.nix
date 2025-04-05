{
  pkgs ? let
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
  in
    import nixpkgs {overlays = [];},
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "nix";

  nativeBuildInputs = with pkgs; [
    # ...
    git

    # Makefile
    just

    # LSP server
    # nixd

    # Linting
    statix

    # Unused code
    deadnix

    # Formatter
    alejandra
  ];

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
