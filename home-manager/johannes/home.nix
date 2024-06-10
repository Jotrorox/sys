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

  home.packages = import ./programs/packages.nix { inherit pkgs; };

  programs.vscode = import ./programs/dev/vscode.nix { inherit pkgs; };
  programs.lf = import ./programs/cli/lf.nix { inherit pkgs; };
  programs.helix = import ./programs/dev/helix.nix { inherit pkgs; };
  programs.git = import ./programs/cli/git.nix { inherit pkgs; };
  programs.zsh = import ./programs/cli/zsh.nix { inherit pkgs; };
  programs.starship = import ./programs/cli/starship.nix { inherit pkgs; };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
