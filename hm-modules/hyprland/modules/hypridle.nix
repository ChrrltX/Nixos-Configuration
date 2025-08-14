{ config, pkgs, lib, ... }:

{
  options = {
    hypridle.enable = 
      lib.mkEnableOption "enables hypridle";
  };
  
  config = lib.mkIf config.hypridle.enable {
    
    security.pam.services.hyprlock = {};

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

       # Hyprlock:
      programs.hyprlock = {
      
        enable = true;
      
        settings = {  
        
          general = {
          
            no_fade_in = false;
            no_fade_out = false;
            hide_cursor = false;
            grace = 0;
            disable_loading_bar = true;
          
          };
        
          background = {

              path = "screenshot";
              blur_passes = 2;
              contrast = 1;
              brightness = 0.5;
              vibrancy = 0.2;
              vibrancy_darkness = 0.2;
          
          };
        
          input-field = {
            
            size = "20%, 5%";
            outline_thickness = 2;
            fade_on_empty = false;
            shadow_passes = 2;
            shadow_size = 2;
            rounding = 20;
            placeholder_text = "<i> Logged in as $USER</i>";
            fail_text = "<b>Wrong Password</b>";
            fail_timeout = 300;
            position = "0, -100";
            halign = "center";
            valign = "center";
            
          };

           # Widgets:

          label = [
          { # Date:
            monitor = "";
            text = '' cmd[update:1000] echo "$(date +"%A, %B %d")" '';
            font_size = 22;
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
          { # Time:
            monitor = "";
            text = '' cmd[update:1000] echo "$(date +"%-I:%M")" '';
            font_size = 95;
            font_family = lib.mkForce "JetBrains Mono Extrabold";
            position = "0, 300";
            halign = "center";
            valign = "center";  
          }
          { # Keyboard Layout:
            monitor = "";
            text = '' Layout: $LAYOUT '';
            font_size = 24;
            onclick = "hyprctl switchxkblayout all next";
            position = "0, 300";
            halign = "center";
            valign = "bottom";         
          }
          ];

        };
      };   

    };
  };
}
