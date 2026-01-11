{ config, pkgs, lib, ... }:

{
  options = {
    vicinae.enable = 
      lib.mkEnableOption "enables vicinae";
  };
  
  config = lib.mkIf config.vicinae.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      wayland.windowManager.hyprland = {
        settings = {
           
  	   # Bind Wofi:
          "$menu" = "vicinae open";

          bind = [ "$mod, Space, exec, $menu" ];

        };
      };  
        
      services.vicinae = {
        enable = true;
<<<<<<< HEAD
        autoStart = true;
=======
        #autoStart = true;
>>>>>>> 56ec908 (Added Impermanence)
        settings = {
          faviconService = "twenty";
          font.size = 11.5;
          popToRootOnClose = false;
          rootSearch.searchFiles = false;
          window = {
            csd = true;
            #opacity = 0.95;
            rounding = 10;
          };
        };
      };

    };

  };  
}

