{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
    shellInit = ''
      # Override the greeting message
      set fish_greeting

      if status is-interactive
          and not set -q TMUX
          # Use 'tmux new -A -s dev' to attach to 'dev' session if it exists, otherwise create it.
          # The 'exec' command replaces the current fish process with tmux, so exiting tmux closes the terminal.
          exec tmux new -A -s dev
      end

      # Set FZF theme
      set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
      --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
      --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
      --color=selected-bg:#45475A \
      --color=border:#313244,label:#CDD6F4"
    '';
  };
}
