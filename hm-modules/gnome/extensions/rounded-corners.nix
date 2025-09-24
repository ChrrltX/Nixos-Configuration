{ config, pkgs, lib, ... }:

{
  options = {
    rounded-corners.enable = 
      lib.mkEnableOption "enables rounded-corners";
  };
  
  config = lib.mkIf config.rounded-corners.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            rounded-corners.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
