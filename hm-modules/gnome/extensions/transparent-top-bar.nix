{ config, pkgs, lib, ... }:

{
  options = {
    transparent-bar.enable = 
      lib.mkEnableOption "enables transparent-bar";
  };
  
  config = lib.mkIf config.transparent-bar.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            transparent-top-bar.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
