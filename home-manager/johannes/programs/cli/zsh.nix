{ pkgs }:

{
  enable = true; # Enable Zsh shell.
  enableCompletion = true; # Enable command completion.
  syntaxHighlighting.enable = true; # Enable syntax highlighting.

  shellAliases = {
    ll = "ls -l"; # Alias for 'ls -l' command.
    update = "sudo nixos-rebuild switch --flake /home/johannes/sys/"; # Alias for updating the system using NixOS.
    cat = "${pkgs.bat}/bin/bat --theme=gruvbox"; # Alias for 'bat' command.
  };
  history.size = 10000; # Set the maximum size of command history.
  history.path = "${config.xdg.dataHome}/zsh/history"; # Set the path for storing command history.

  oh-my-zsh = {
    enable = true; # Enable Oh My Zsh framework.
    plugins = [ "git" "thefuck" ]; # List of plugins to enable.
    theme = "robbyrussell"; # Set the theme for the Zsh shell.
  };
}
