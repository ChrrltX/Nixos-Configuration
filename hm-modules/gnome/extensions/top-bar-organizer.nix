{ config, pkgs, lib, ... }:

{
  options = {
    bar-organizer.enable = 
      lib.mkEnableOption "enables bar-organizer";
  };
  
  config = lib.mkIf config.bar-organizer.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            top-bar-organizer.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
