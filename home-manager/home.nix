{
  inputs,
  lib,
  config,
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "johannes";
    homeDirectory = "/home/johannes";
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "zsh";
    }; 
  };

  home.packages = with pkgs; [
    # Internet
    firefox
    vesktop

    # Development
    vscode-fhs
    jetbrains.idea-community

    # Media
    vlc
    spotify
    mediathekview
    
    # Games
    steam
    prismlauncher
    
    # TUI tools
    pfetch
    btop
    lazygit
    
    # Cli tools
    thefuck
    gh 
    ripgrep

    # Librarys and Programming Languages

  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Configure firefox
  programs.firefox = {
    enable = true;
    profiles.johannes = {

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
      search.force = true;

      bookmarks = [];

      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        darkreader
        facebook-container
        github-file-icons
        gruvbox-dark-theme
        istilldontcareaboutcookies
        musescore-downloader
        privacy-badger
        return-youtube-dislikes
        ublock-origin
        youtube-shorts-block
        dictionary-german
      ];

    };
  };

  # Configure neovim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      zen-mode.enable = true;
      bufferline.enable = true;

      harpoon.enable = true;
      harpoon.enableTelescope = true;
      harpoon.saveOnChange = true;
      harpoon.saveOnToggle = true;
      telescope.enable = true;
      nvim-tree.enable = true;
      oil.enable = true;

      which-key.enable = true;

      # copilot-lua.enable = true;
      # copilot-cmp.enable = true;
      copilot-vim.enable = true;

      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
        };
      };
    };

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
    };

    globals.mapleader = " ";

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>o";
      }
      {
        action = "<cmd>NvimTreeOpen<CR>";
        key = "<leader>e";
      }
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

  # Configure git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Jotrorox";
    userEmail = "jotrorox@gmail.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    extraConfig = {
      credential.helper = "${
	      pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

  # Configure zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake /home/johannes/sys/#home";
      update-home = "home-manager switch --flake /home/johannes/sys/#johannes@home";
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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
