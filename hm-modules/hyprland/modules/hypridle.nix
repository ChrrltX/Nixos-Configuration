{ config, pkgs, lib, ... }:

{
  options = {
    hypridle.enable = 
      lib.mkEnableOption "enables hypridle";
  };
  
  config = lib.mkIf config.hypridle.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {

       # Hypridle:
      services.hypridle = {
    
        enable = true;
      
        settings = {
        
          general = {
          
            lock_cmd = "pidof hyprlock || hyprlock";
            ignore_dbus_inhibit = "/opt/spotify/spotify";

          };
        
          listener = [
            
            { 
              timeout = 300; 
              on-timeout = "loginctl lock-session";
            }

            { 
              timeout = 420; 
              on-timeout = "brightnessctl -s set 10"; 
              on-resume = "brightnessctl -r"; 
            }
            
            { 
              timeout = 900; 
              on-timeout = "hyprctl dispatch dpms off"; 
              on-resume = "hyprctl dispatch dpms on && brightnessctl -r"; 
            }
            
            { 
              timeout = 1200; 
              on-timeout = "systemctl suspend"; 
            }

          ];

        };
      };

    };
  };
}
