{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace'";
      "files.autoSave" = "afterDelay";
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "window.zoomLevel" = -0.1;
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Ayu Next";
      "workbench.iconTheme" = "eq-material-theme-icons-darker";
      "background.customImages" = [
        "https://w.wallhaven.cc/full/31/wallhaven-3ll3zv.jpg"
      ];
    };
    extensions = with pkgs.vscode-extensions; [
      njpwerner.autodocstring
      tamasfe.even-better-toml
      usernamehw.errorlens
      davidanson.vscode-markdownlint
      jnoortheen.nix-ide
      ms-python.python
      ms-python.vscode-pylance
      mkhl.direnv
      editorconfig.editorconfig
      matklad.rust-analyzer
      kamadorueda.alejandra
      viktorqvarfordt.vscode-pitch-black-theme
      skellock.just
      gruntfuggly.todo-tree
      github.vscode-github-actions
      github.vscode-pull-request-github
      mhutchie.git-graph
    ];
  };
}
