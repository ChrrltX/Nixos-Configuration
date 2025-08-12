{ config, pkgs, lib, ... }:

{
  options = {
    hypridle.enable = 
      lib.mkEnableOption "enables hypridle";
  };
  
  config = lib.mkIf config.hypridle.enable {
    
    security.pam.services.hyprlock = {};
    #security.pam.services.hyprlock.rules.auth.fprintd.control = "required";   

    home-manager.users.chrrltx = { pkgs, ... }: {

       # Hypridle:
      services.hypridle = {
    
        enable = true;
      
        settings = {
        
          general = {
          
            lock_cmd = "pidof hyprlock || hyprlock";
            before_sleep_cmd = "hyprlock";
            after_sleep_cmd = "hyprctl dispatch dpms on";

          };
        
          listener = [
            
            { timeout = 300; on-timeout = "hyprlock"; }
            { timeout = 420; on-timeout = "brightnessctl -s set 10"; on-resume = "brightnessctl -r"; }
            { timeout = 900; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on && brightnessctl -r"; }
            { timeout = 1800; on-timeout = "systemctl suspend"; }

          ];

        };
      };

       # Hyprlock:
      programs.hyprlock = {
      
        enable = true;
      
        settings = {  
        
          general = {
          
            grace = 300;
            hide_cursor = true;
          
          };
        
          background = {

              path = "screenshot";
              blur_passes = 3;
              blur_size = 8;
          
          };
        
          input-field = {
            
              size = "20%, 5%";
              position = "0, -80";
              monitor = "";
              dots_center = true;
              fade_on_empty = false;
              #font_color = "rgb(202, 211, 245)";
              #inner_color = "rgb(91, 96, 120)";
              #outer_color = "rgb(24, 25, 38)";
              outline_thickness = 5;
              placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
              shadow_passes = 2;
            
          };

           # Time:
          label = {
            monitor = "";
            text = "$TIME";
            font_size = 90;
            position = "-30, 0";
            halign = "center";
            valign = "top";
          };

           # Date:
          #label = {
            #monitor = "";
            #text = '' cmd[update:60000] date +"%A, %d %B %Y" '';
            #font_size = 25;
            #position = "-30, -150";
            #halign = "right";
            #valign = "top";
          #};
           
           # KB Layout:
          #label = {
            #monitor = "";
            #text = "$LAYOUT[en,cz]";
            #font_size = 24;
            #onclick = "hyprctl switchxkblayout all next";
            #position = "250, -20";
            #halign = "center";
            #valign = "center";
          #};

        };
      };   

    };
  };
}
