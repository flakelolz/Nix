{
  description = "A Nix-flake-based Lua 5.4 development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {

      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              lua54Packages.lua
              lua54Packages.luarocks
              lua-language-server
              stylua
            ];

            # Useful Lua paths
            LUA_PATH = "./?.lua;${pkgs.lua54Packages.lua}/share/lua/5.4/?.lua;;";
            LUA_CPATH = "./?.so;${pkgs.lua54Packages.lua}/lib/lua/5.4/?.so;;";

            shellHook = ''
              echo "Lua 5.4.8 development shell loaded"
            '';
          };
        }
      );
    };
}
