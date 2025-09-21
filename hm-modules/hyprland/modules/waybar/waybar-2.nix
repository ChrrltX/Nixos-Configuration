{ config, pkgs, lib, ... }:

{ 
  options = {
    waybar-2.enable = 
      lib.mkEnableOption "enables waybar-2";
  };
  
  config = lib.mkIf config.waybar-2.enable {

  home-manager.users.chrrltx = { pkgs, ... }: {
    
    stylix.targets.waybar.enable = false;

    programs.waybar = {
      
      enable = true;

      settings = {

        mainBar = {
	  
	  layer = "top";
	  position = "top";
	  height = 45;
	  margin-top = 0;
          margin-bottom = 0;
	  margin-left = 0;
	  margin-right = 0;
           
	   # Module Positions:

	  modules-left = [
            "hyprland/workspaces"
            "custom/expand-right"
          ];
	  modules-center = [
            "cava"
            "clock"
            "cava"
	  ];  
	  modules-right = [ 
            "pulseaudio"
            "network"
            "battery"
	  ];

	   # Modules:

          "clock" = {
            format = " {:%I:%M %p}";
            format-alt = " {:%I:%M %p 󰸘 %a, %d %b}";
            interval = 1;
            tooltip = false;
          };

          "hyprland/workspaces" = {
            format = "{name}";
            format-icons = {
              #active = "";
              active = "";
              default = "";
              empty = "";
            };  
            persistent-workspaces = {
              "*" = 5;
            };  
          };

          "cava" = {
             format = "{icon}";
            bars = 15;
            autosens = 1;
            framerate = 144;
            method = "pulse";
            source = "auto";
            hide_on_silence = true;
            monstercat = true;
            waves = true;
            format-icons = [
              "▁" 
              "▂" 
              "▃" 
              "▄" 
              "▅" 
              "▆" 
              "▇" 
              "█" 
            ];
            bar_delimiter = 0;
            sleep_timer = 2;
            input_delay = 1;           
          };

          "pulseaudio" = {
            format = "{volume}% {icon}";
            format-icons = [
              ""
              ""
            ];
            format-muted = "";
            scroll-step = 1;
            on-click = "pavucontrol";
            tooltip = false;
          };

	  "network" = {
            format = "{icon}";
            format-icons = {
              wifi = [
                "󰤟"
                "󰤢"
                "󰤥"
                "󰤨"
              ];
              ethernet = "";
              disconnected = ""; 
            };
            tooltip = false;
	    on-click = "kitty nmtui";
	  };

          "battery" = {
            interval = 30;
            states = {
              good = 95;
              warning = 40;
              critical = 20;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% 󰂄 ";
            format-alt = "{time} {icon}";
            format-icons = [
              "󰁻"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
            ];
          };   

          "custom/expand-right" = {
            format = "";
            tooltip = false;
          };

          "custom/endpoint-right" = {
            format = "|";
            tooltip = false;
          };

          "group/expand-right" = {
	    orientation = "horizontal";
	    drawer = {
	      transition-duration = 600;
	      transition-to-right = true;
	      click-to-reveal = true;
	    };
	    modules = [
              "tray"
              "custom/endpoint-right"
            ];
          };  

	};
      };

      style = ''
        
	* {
	  font-family: "SF Pro Display", "JetBrainsMono Nerd Font Propo";
	  font-size: 15px;
	  font-weight: bold;
	}  

	window#waybar {
	  all:unset;
	} 

	.modules-left {
          padding:7px;
          margin:0;
          border-radius: 0px 0px 10px 0px;
          background-color: rgba(17, 17, 27, 80);
	}

	.modules-center {
          padding:7px;
          margin:0;
          border-radius:0px 0 10px 10px;
          background-color: rgba(17, 17, 27, 80);
	}
        
        .modules-right {
          padding:7px;
          margin:0;
          border-radius:0px 0px 0px 10px;
          background-color: rgba(17, 17, 27, 80);
	}  

	tooltip {
	}

        #clock {
          padding: 0px 5px;
          background-color: transparent;
          transition: all .3s ease;
        }  

        #clock:hover {
          color: rgb(147, 153, 178);
        }  

        #workspaces {
          padding: 0px 5px;
        }  

        #workspaces button {
          padding: 0px 5px;
          background-color: transparent;
          transition: all .3s ease;
        } 

        #workspaces button:hover {
          background-color: rgb(49, 50, 68);
          color: rgb(147, 153, 178);
        }  

	#workspaces button.active {
          padding: 0px 5px;
	  background-color: rgb(203, 166, 247);
          color: rgb(24, 24, 37);
        }

        #workspaces button.empty {
          padding: 0px 5px;
          color: rgb(69, 71, 90);
        } 

        #workspaces button.empty:hover {
          background-color: rgb(49, 50, 68);
          color: rgb(147, 153, 178);
        }  

	#workspaces button.empty.active {
          background-color: rgb(180, 190, 254);
	  color: rgb(49, 50, 68);
	}

        #cava {
          padding: 0px 5px;
          transition: all .3s ease;         
        }

	#network {
	  padding: 0px 5px;
	  transition: all .3s ease;
	}

        #battery {
          padding: 0px 5px;
          transition: all .3s ease;
        }

        #battery.charging {
          color: rgb(166, 227, 161);
        }

        #battery.warning:not(.charging) {
          color: rgb(250, 179, 135);
        }

        #battery.critical:not(.charging) {
          color: rgb(243, 139, 168);
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }   

        #pulseaudio {
          padding: 0px 5px;
          transition: all .3s ease;
        }  

        #group-expand-right {
          padding: 0px 5px;
          transition: all .3 ease;
        }

        #custom-expand-right {
          padding: 0px 5px;
          transition: all .3s ease;
        }  

	#custom-endpoint {
          padding: 0px 5px;
	}

      '';

    };  
  };
  };
}
