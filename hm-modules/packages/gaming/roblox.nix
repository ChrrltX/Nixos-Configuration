{ config, inputs, pkgs, lib, ... }:

{
  options = {
    roblox.enable = 
      lib.mkEnableOption "enables roblox";
  };
  
  config = lib.mkIf config.roblox.enable {

    config = {
    
      services.flatpak = {
        enable = true;
        packages = [
          "org.vinegarhq.Sober"
          "org.vinegarhq.Vinegar"
        ];
        uninstallUnmanaged = true;
        update.auto.enable = false;
      };

    ];  
    
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.flatpak ];

      xdg.systemDirs.data = [
        "/var/lib/flatpak/exports/share"
        "${config.home.homeDirectory}/.local/share/flatpak/exports/share"
      ];
    
    };

  };

}
