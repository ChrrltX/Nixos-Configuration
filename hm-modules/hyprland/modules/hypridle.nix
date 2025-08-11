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
          
            lock_cmd = "hyprlock";
            before_sleep_cmd = "hyprlock";
            after_sleep_cmd = "hyprctl dispatch dpms on";
          };
        
          listener = [
          
            { timeout = 600; on-timeout = "hyprlock"; }
            { timeout = 900; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
            { timeout = 1800; on-timeout = "systemctl suspend"; }
          ];

        };
      };

       # Hyprlock:
      programs.hyprlock = {
      
        enable = true;
      
        settings = {
        
          general = {
          
            disable_loading_bar = true;
            grace = 300;
            hide_cursor = true;
          };
        
          background = lib.mkForce [
            {
              path = "screenshot";
              blur_passes = 3;
              blur_size = 8;
            }
          ];
        
          input-field = [
            {
              size = "200, 50";
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
            }
          ];

        };
      };   

    };
  };
}
