{ pkgs }:

{
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
}
