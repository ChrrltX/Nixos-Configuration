{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    
    stylix.targets.waybar.enable = false;

    wayland.windowManager.hyprland = {
      
      settings = {

        exec-once = "waybar";

      };

    };  

    programs.waybar = {
      
      enable = true;

      settings = {

        mainBar = {
	  
	  layer = "top";
	  position = "top";
	  height = 50;
	  margin-top = 5;
	  margin-left = 18;
	  margin-right = 18;
           
	   # Module Positions:

	  modules-left = [
	    
	    "custom/notification"
	    "hyprland/workspaces"
	    "tray"

	  ];
	  modules-center = [
	    
	    "clock"

	  ];  
	  modules-right = [ 
	    
	    "group/expand"
	    "pulseaudio" 
	    "network"

	  ];

	   # Modules:
	  
          "hyprland/workspaces" = {
            format = "{name}";
	    format-icons = {
	      active = "";
	      default = "";
	      empty = "";
	    };  
	    persistent-workspaces = {
	      "*" = 3;
	    };  
	  };

	  "custom/notification" = {
	    tooltip = false;
	    format = "";
	    on-click = "swaync-client -t -sw";
	    escape = true;
	  };

          "clock" = {
	    format = "{:%I:%M:%S %p}";
	    interval = 1;
	  };

	  "network" = {
	    format-wifi = "";
	    format-ethernet = "";
	    format-disconnected = "";
	    tooltip-format-disconnected = "Disconnected";
	    tooltip-format-wifi = "{essid} ({signalStrength}%) ";
	    tooltip-format-ethernet = "{ifname} ";
	    on-click = "kitty nmtui";
	  }; 

          "custom/expand" = {
	    format = "";
	    tooltip = false;
	  };

	  "custom/endpoint" = {
	    format = "|";
	    tooltip = false;
	  };

	  "group/expand" = {
	    orientation = "horizontal";
	    drawer = {
	      transition-duration = 600;
	      transition-to-left = true;
	      click-to-reveal = true;
	    };
	    modules = [
	      "custom/expand" 
	      "cpu"
	      "memory"
	      "temperature"
	      "custom/endpoint"
	    ];
	  };

	  "cpu" = {
	    format = "󰻠";
	    tooltip = true;
	  };

	  "memory" = {
	    format = "";
	  };

	  "temperature" = {
	    critical-threshold = 80;
	    format = "";
	  };

	  "tray" = {
	    icon-size = 14;
	    spacing = 10;
	  };  
	
	};
      };

      style = ''
        
	* {
	  font-family: 'JetBrainsMono Nerd Font';
	  font-size: 15px;
	  font-weight: bold;
	}  

	window#waybar {
	  all:unset;
	} 

	.modules-left {
	  padding:7px;
	  margin:10 0 5 10;
	  border-radius:10px;
	  background: rgba(30, 30, 46, 0.9);
	  box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
	}

	.modules-center {
	  padding:7px;
	  margin:10 0 5 0;
	  border-radius:10px;
	  background: rgba(30, 30, 46, 0.9);
	  box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
	}
        
        .modules-right {
	  padding:7px;
	  margin: 10 10 5 0;
	  border-radius:10px;
	  background: rgba(30, 30, 46, 0.9);
	  box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
	}  

	tooltip {
	  background:rgba(30, 30, 46, 0.5);
	  color: @color7;
	}

	#custom-notification:hover, #network:hover, #cpu:hover, #memory:hover, #temperature:hover {
	  transition: all .3s ease;
	  color:@color9;
	}

	#custom-notification {
	  padding: 0px 5px;
	  transition: all .3s ease;
	  color:@color7;
	}

	#clock {
	  padding: 0px 5px;
	  color:@color7;
	  background-color: transparent;
	  transition: all .3s ease;
	}

	#pulseaudio {
	  padding: 0px 5px;
	  color:@color7;
	  background-color: transparent;
	  transition: all .3s ease;
	}  

	#workspaces {
	  padding: 0px 5px;
	}

	#workspaces button {
	  all:unset;
	  padding: 0px 5px;
	  color: alpha(@color9,.4);
	  transition: all .2s ease;
	}

	#workspaces button:hover {
	  color:rgba(0,0,0,0);
	  border: none;
	  text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
	  transition: all 1s ease;
	}

	#workspaces button.active {
	  color: @color9;
	  border: none;
	  text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
	}

        #workspaces button.empty {
	  color: rgba(0,0,0,0);
	  border: none;
	  text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
	}

        #workspaces button.empty:hover {
	  color: rgba(0,0,0,0);
	  border: none;
	  text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
	  transition: all 1s ease;
	}

	#workspaces button.empty.active {
	  color: @color9;
	  border: none;
	  text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
	}

	#network {
	  padding: 0px 5px;
	  transition: all .3s ease;
	  color:@color7;
	}

	#group-expand {
          padding: 0px 5px;
	  transition: all .3s ease;
	}

	#custom-expand {
	  padding: 0px 5px;
	  color:alpha(@foreground,.2);
	  text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
	  transition: all .3s ease;
	}

	#custom-expand:hover {
	  color:rgba(255,255,255,.2);
	  text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
	}

	#cpu, #memory, #temperature {
	  padding: 0px 5px;
	  transition: all .3s ease;
	  color:@color7;
	}

	#custom-endpoint {
	  color:transparent;
	  text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);
	}

	#tray {
	  padding: 0px 5px;
	  transition: all .3s ease;
	}

	#tray menu * {
	  padding: 0px 5px;
	  transition: all .3s ease;
	}

	#tray menu separator {
	  padding: 0px 5px;
	  transition: all .3s ease;
	}  

      '';

      # Inspired by: https://github.com/elifouts/Dotfiles/tree/main

    };  
  };  
}
