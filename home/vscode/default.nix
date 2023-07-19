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
      "window.zoomLevel" = 1;
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Solarized Dark";
      "workbench.iconTheme" = "eq-material-theme-icons-darker";
    };
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      zhuangtongfa.material-theme
      roman.ayu-next
    ];
  };
}
