{ pkgs, config, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.systemd.enable = true;
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["rings"];})];  
    };
  };
}