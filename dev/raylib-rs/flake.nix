{
  description = "A Nix-flake-based Raylib-rs development environment";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
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
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                rust-overlay.overlays.default
                self.overlays.default
              ];
            };
          }
        );
    in
    {
      overlays.default = final: prev: {
        rustToolchain =
          let
            rust = prev.rust-bin;
          in
          if builtins.pathExists ./rust-toolchain.toml then
            rust.fromRustupToolchainFile ./rust-toolchain.toml
          else if builtins.pathExists ./rust-toolchain then
            rust.fromRustupToolchainFile ./rust-toolchain
          else
            rust.nightly.latest.default.override {
              extensions = [
                "rust-src"
                "rustfmt"
                "rustc-codegen-cranelift-preview"
              ];
            };
      };

      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell rec {
            packages = with pkgs; [
              rustToolchain
              openssl
              pkg-config
              cargo-deny
              cargo-edit
              cargo-watch
              rust-analyzer
              clippy
              clang
              mold
            ];

            env = {
              # Required by rust-analyzer
              RUST_SRC_PATH = "${pkgs.rustToolchain}/lib/rustlib/src/rust/library";
            };

            nativeBuildInputs = with pkgs; [
              pkg-config
              cmake
              ninja
            ];

            buildInputs = with pkgs; [
              udev
              alsa-lib-with-plugins
              vulkan-loader

              # OpenGL / Mesa
              mesa
              libGL

              # X11 dependencies
              xorg.libX11
              xorg.libXcursor
              xorg.libXi
              xorg.libXrandr
              xorg.libxcb
              xorg.libXext
              xorg.libXinerama

              # Keyboard + Wayland
              libxkbcommon
              wayland

              # for bindgen
              llvmPackages.libclang

              # C++ runtime for libstdc++.so.6
              stdenv.cc.cc.lib
            ];

            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
            LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

            shellHook = ''
              export CC=clang
              export CXX=clang++


              # Auto-init cargo project if not present
              if [ ! -f Cargo.toml ]; then
                echo "No Cargo.toml found, running cargo init..."
                cargo init .
              fi
            '';
          };
        }
      );
    };
}
