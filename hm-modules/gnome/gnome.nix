{ config, pkgs, lib, ... }:

{ 
  options = {
    gnome.enable = 
      lib.mkEnableOption "enables gnome";
  };

  config = lib.mkIf config.gnome.enable {

    services.desktopManager.gnome.enable = true;

  };  
}
