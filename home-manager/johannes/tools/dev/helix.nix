{ pkgs }:

{
  enable = true;
  settings = {
    # The theme for the 'helix' program
    theme = "gruvbox_transparent";
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
  };
  themes = {
    # Configuration for the 'gruvbox_transparent' theme
    gruvbox_transparent = {
      "inherits" = "gruvbox";
      "ui.background" = { };
    };
  };
}
