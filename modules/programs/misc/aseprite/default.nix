{ pkgs, ... }:
{
  home.packages = [
    (pkgs.aseprite.overrideAttrs (_: { }))
  ];
}
