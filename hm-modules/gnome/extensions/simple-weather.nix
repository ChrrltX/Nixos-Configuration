{ config, pkgs, lib, ... }:

{
  options = {
    simple-weather.enable = 
      lib.mkEnableOption "enables simple-weather";
  };
  
  config = lib.mkIf config.simple-weather.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            simpleweather.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
