{ config, pkgs, ... }:

{
  imports = [
  ];

  home.username = "johannes";
  home.homeDirectory = "/home/johannes";

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  home.file = { };

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    kdePackages.kate
    vesktop
    spotify
    ungoogled-chromium
    steam
    thefuck
    gh
    ripgrep
    nixpkgs-fmt
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.copilot
      github.copilot-chat
      github.vscode-github-actions
      jdinhlife.gruvbox
      equinusocio.vsc-material-theme-icons
    ];
  };

  # Configure helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    themes = {
      gruvbox_transparent = {
        "inherits" = "gruvbox";
        "ui.background" = { };
      };
    };
  };

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Johannes (Jotrorox) Müller";
    userEmail = "mail@jotrorox.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

  # Configure zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake /home/johannes/sys/";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

  # Configure starship.rs
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
