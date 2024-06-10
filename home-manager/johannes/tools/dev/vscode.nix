{ pkgs }:

{
  enable = true; # Enable the Visual Studio Code program.
  package = pkgs.vscode-fhs; # Use the vscode-fhs package from the Nixpkgs collection.
  extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide # Install the Nix IDE extension.
    github.copilot # Install the GitHub Copilot extension.
    github.copilot-chat # Install the GitHub Copilot Chat extension.
    github.vscode-github-actions # Install the GitHub Actions extension.
    jdinhlife.gruvbox # Install the Gruvbox theme extension.
    equinusocio.vsc-material-theme-icons # Install the Material Theme Icons extension.
  ];
}
