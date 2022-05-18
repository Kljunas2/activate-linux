{
  description = "Activate Linux watermark for wayland";

  inputs.utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.activate-linux = pkgs.stdenv.mkDerivation {
          pname = "activate-linux";
          version = "0.0.1";
          src = ./.;
          nativeBuildInputs = with pkgs; [ pkg-config ];
          buildInputs = with pkgs; [ gtk3 gtk-layer-shell ];
          installPhase = ''
            mkdir -p $out/bin
            cp bin/activate-linux $out/bin/activate-linux
          '';
        };

        defaultPackage = self.packages.${system}.activate-linux;
      });
}
