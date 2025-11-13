{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      settings = {
        
	general = {
           
	   # Gaps Between Windows:
	  gaps_in = "5";
	  gaps_out = "18";
	  border_size = "3";
	  #"col.active_border" = lib.mkForce "rgba(167,125,255,1) rgba(86,65,129,1) 45deg";
          "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0E}) rgb(${config.stylix.base16Scheme.base0C}) 45deg";

	  resize_on_border = false;
	  allow_tearing = true;
	  layout = "dwindle";
	
	};

	decoration = {
	   
	   # Window Corner Rounding:
	  rounding = "10";
	  rounding_power = "2";
	   
	   # Window Opacity:
	  active_opacity = "1";
	  inactive_opacity = "0.85";

           # Blur:
          blur = {
            
            enabled = true;
            
            size = 5;
            passes = 2;
            new_optimizations = true;
            popups = true;
          
          }; 

	  shadow = {
	    
	    enabled = true;

	    range = "4";
	    render_power = "3";

	  };

        };  

	dwindle = {
	  
	  pseudotile = true;
	  preserve_split = true;

	};

	master = {
	  
	  new_status = "master";

	};

	misc = {
          
          disable_hyprland_logo = true;
	  disable_splash_rendering = true;

	};   

        workspace = [
          
          "1, monitor:DP-3"
          "2, monitor:DP-3"
          "3, monitor:DP-3"
          "4, monitor:DP-3"
          "5, monitor:DP-3"
          "6, monitor:HDMI-A-1"
          "7, monitor:HDMI-A-1"
          "8, monitor:HDMI-A-1"
          "9, monitor:HDMI-A-1"
          "10, monitor:HDMI-A-1"

        ];  

      };
    };
  };  
}
