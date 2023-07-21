{config, pkgs, lib, pks, ...}: {
  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles = {
      ${config.home.username} = {
        search = {
          default = "Google";
          force = true;
        };
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