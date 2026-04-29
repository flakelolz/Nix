{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "flakelolz";
        email = "michaelgonzalez.code@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
