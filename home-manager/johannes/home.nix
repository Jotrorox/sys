{ config, pkgs, ... }:

{
  imports = [
  ];

  home.username = "johannes";

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.file = { };

  # Configure nixpkgs to allow unfree software
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # Install packages and programs
  home.packages = with pkgs; [
    # Web
    ungoogled-chromium
    vesktop

    # Media
    spotify

    # Games
    steam
    mangohud
    protonup

    # CLI tools
    thefuck
    gh
    ripgrep
    nixpkgs-fmt
  ];

  programs.vscode = import ./tools/dev/vscode.nix { inherit pkgs; };

  programs.lf = import ./tools/cli/lf.nix { inherit pkgs; };

  programs.helix = import ./tools/dev/helix.nix { inherit pkgs; };

  programs.git = import ./tools/cli/git.nix { inherit pkgs; };

  # Configuration for the Zsh shell.
  programs.zsh = {
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
  };

  # Configures the Starship program.
  programs.starship = {
    enable = true;
    settings = {
      # Adds a newline after the prompt.
      add_newline = true;
      character = {
        # Sets the success symbol to "[➜](bold green)".
        success_symbol = "[➜](bold green)";
        # Sets the error symbol to "[➜](bold red)".
        error_symbol = "[➜](bold red)";
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
