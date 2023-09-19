{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      "editor.fontSize" = 12;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace'";
      "files.autoSave" = "afterDelay";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "window.zoomLevel" = -0.1;
      "workbench.colorTheme" = "Pitch Black";
      "workbench.startupEditor" = "none";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
      };
    };
    extensions = with pkgs.vscode-extensions; [
      njpwerner.autodocstring
      tamasfe.even-better-toml
      usernamehw.errorlens
      davidanson.vscode-markdownlint
      jnoortheen.nix-ide
      editorconfig.editorconfig
      matklad.rust-analyzer
      kamadorueda.alejandra
      skellock.just
      gruntfuggly.todo-tree
      github.vscode-github-actions
      github.vscode-pull-request-github
      mhutchie.git-graph
      github.copilot
      vscodevim.vim
      usernamehw.errorlens
    ];
  };
}
