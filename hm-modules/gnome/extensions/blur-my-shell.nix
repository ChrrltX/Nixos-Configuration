{ config, pkgs, lib, ... }:

{
  options = {
    blur-shell.enable = 
      lib.mkEnableOption "enables blur-shell";
  };
  
  config = lib.mkIf config.blur-shell.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [

            blur-my-shell.extensionUuid  
          
          ];
        };
      };  
    };

  };  
}
