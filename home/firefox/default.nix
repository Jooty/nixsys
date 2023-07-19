{config, ...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      ${config.home.username} = {
        settings = {
          "general.smoothScroll" = true;
          "browser.toolbars.bookmarks.visibility" = "always";
        };
        userChrome = ''
          :root[titlepreface="no bar"] #navigator-toolbox-background {
            visibility: hidden;
            height: 0;
          }
        '';
      };
    };
  };
}