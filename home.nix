{ pkgs, inputs, ... }: {
  imports = [
    modules/programs/browser/zen
    inputs.zen-browser.homeModules.default
    modules/programs/cli/bat
    modules/programs/cli/btop
    modules/programs/cli/git
    modules/programs/cli/starship
    modules/programs/cli/tmux
    modules/programs/cli/yazi
    modules/programs/cli/zoxide
    modules/programs/editor/neovim
    modules/programs/shell/bash
    modules/programs/shell/fish
    modules/programs/terminal/kitty
  ];

  home.username = "flakelolz";
  home.homeDirectory = "/home/flakelolz";

  home.stateVersion = "26.05";

  home.sessionVariables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    nh
    ripgrep
    fd
    lazygit
    eza
    gh
    fzf
    tldr
    jq
  ];

  programs.home-manager.enable = true;
}
