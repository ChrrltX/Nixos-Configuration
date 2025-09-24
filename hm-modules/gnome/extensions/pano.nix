{ config, pkgs, lib, ... }:

{
  options = {
    pano.enable = 
      lib.mkEnableOption "enables pano";
  };
  
  config = lib.mkIf config.pano.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            pano.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
