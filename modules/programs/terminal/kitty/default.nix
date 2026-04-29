{ pkgs, config, lib, inputs, ... }:
let
  homeDir = config.home.homeDirectory;
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [
  # kitty
    pkgs.nerd-fonts.jetbrains-mono
  ];

  home.file.".config/kitty" = {
    source = symlink "${homeDir}/Nix/modules/programs/terminal/kitty/kitty/";
    recursive = true;
  };
}
