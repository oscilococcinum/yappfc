{
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in{
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          python312
          calculix
        ] ++ (
        with python312Packages; [
            meshio
            numpy
            matplotlib
            pyside6
            pyvista
        ]);

        shellHook = ''
          
        '';
        };
    };
}