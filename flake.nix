{
  description = "Package flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, ... }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.${system}.default = pkgs.callPackage ./iiserpune-login-daemon { };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          chromium
          chromedriver
          gobject-introspection
          (python312.withPackages (pypkgs: with pypkgs; [
            selenium
            keyring
            pydbus
            pygobject3
          ]))
        ];
      };
    };
}
