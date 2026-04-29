{ config, ... }:
let
  homeDir = config.home.homeDirectory;
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.bat.enable = true;

  home.file.".config/bat" = {
    source = symlink "${homeDir}/Nix/modules/programs/cli/bat/bat/";
    recursive = true;
  };
}
