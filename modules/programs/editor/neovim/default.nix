{ pkgs, config, ... }:
let
  homeDir = config.home.homeDirectory;
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    sideloadInitLua = true;
    extraPackages = with pkgs; [
      git
      unzip
      ripgrep
      fzf
      fd
      lazygit

      rustc
      cargo
      rust-analyzer
      clang
      nodejs
      python314
      nixfmt
      tree-sitter
    ];
  };

  home.file.".config/nvim" = {
    source = symlink "${homeDir}/Nix/modules/programs/editor/neovim/nvim/";
    recursive = true;
  };
}
