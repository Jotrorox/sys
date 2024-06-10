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

  programs.vscode = import ./programs/dev/vscode.nix { inherit pkgs; };

  programs.lf = import ./programs/cli/lf.nix { inherit pkgs; };

  programs.helix = import ./programs/dev/helix.nix { inherit pkgs; };

  programs.git = import ./programs/cli/git.nix { inherit pkgs; };

  programs.zsh = import ./programs/cli/zsh.nix { inherit pkgs; };

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
