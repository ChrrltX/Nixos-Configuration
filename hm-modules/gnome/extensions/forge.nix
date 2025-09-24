{ config, pkgs, lib, ... }:

{
  options = {
    forge.enable = 
      lib.mkEnableOption "enables forge";
  };
  
  config = lib.mkIf config.forge.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            forge.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
