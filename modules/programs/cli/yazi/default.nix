{ config, ... }:
let
  homeDir = config.home.homeDirectory;
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.yazi.enable = true;
  programs.yazi.shellWrapperName = "y";

  home.file.".config/yazi" = {
    source = symlink "${homeDir}/Nix/modules/programs/cli/yazi/yazi";
  };
}
