{
  description = "A basic flake using pyproject.toml project metadata";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }: {
    defaultPackage.x86_64-linux = 
      with import nixpkgs { system = "x86_64-linux"; };
        pkgs.python3Packages.buildPythonPackage {
          pname = "infectious_disease_simulation";
          pyproject = true;
          version = "1.0.0";
          src = ./.;
          build-system = with python3Packages; [ poetry-core ];
          dependencies = with pkgs.python3Packages; [
            tkinter
            matplotlib
            numpy
            pygame
          ];
        };
  };
}
