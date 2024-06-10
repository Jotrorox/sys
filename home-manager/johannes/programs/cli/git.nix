{ pkgs }:

{
  enable = true; # Enable the 'git' program.
  package = pkgs.gitFull; # Use the 'gitFull' package from the Nixpkgs collection.
  userName = "Johannes (Jotrorox) Müller"; # Set the user name for Git commits.
  userEmail = "mail@jotrorox.com"; # Set the user email for Git commits.
  aliases = {
    pu = "push"; # Define an alias 'pu' for the 'push' command.
    co = "checkout"; # Define an alias 'co' for the 'checkout' command.
    cm = "commit"; # Define an alias 'cm' for the 'commit' command.
  };
}
