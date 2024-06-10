{ pkgs }:

{
  enable = true;
  commands = {
    dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
    editor-open = ''$$EDITOR $f'';
    mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
    '';
  };
  settings = {
    preview = true;
    hidden = true;
    drawbox = true;
    icons = true;
    ignorecase = true;
  };
  keybindings = {
    "\\\"" = "";
    o = "";
    c = "mkdir";
    "." = "set hidden!";
    "`" = "mark-load";
    "\\'" = "mark-load";
    "<enter>" = "open";
    do = "dragon-out";
    "g~" = "cd";
    gh = "cd";
    "g/" = "/";
    ee = "editor-open";
  };
}
