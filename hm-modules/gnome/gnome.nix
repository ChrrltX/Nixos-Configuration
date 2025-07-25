{ config, pkgs, lib, ... }:

{ 
  options = {
    gnome.enable = 
      lib.mkEnableOption "enables gnome";
  };

  config = lib.mkIf config.gnome.enable {
     
     # Enable Gnome:
    services.desktopManager.gnome.enable = true;
     
     # Disable All Gnome Apps:
    services.gnome.core-utilities.enable = false;

  };  
}
