{ ... }:
{
  programs.bash = {
    bashrcExtra = ''
      # Automatically start fish if not already in fish and in interactive shell
      if [ -z "$FISH_VERSION" ] && [[ $- == *i* ]]; then
        exec fish
      fi
    '';
  };
}
