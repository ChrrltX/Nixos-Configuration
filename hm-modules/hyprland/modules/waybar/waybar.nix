{ config, pkgs, lib, ... }:

{ 
  options = {
    waybar.enable = 
      lib.mkEnableOption "enables waybar";
  };
  
  config = lib.mkIf config.waybar.enable {

  home-manager.users.chrrltx = { pkgs, ... }: {
    
    stylix.targets.waybar.enable = false;

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
	    
            "custom/nixos"
	    "hyprland/workspaces"
            "mpris"
            "cava"

	  ];
	  modules-center = [
	    
	    "clock"

	  ];  
	  modules-right = [ 
	    
	    "group/expand"
	    "pulseaudio"
            "pulseaudio/slider"
            "bluetooth"
	    "network"
            "battery"

	  ];

	   # Modules:

          "custom/nixos" = {
            format = "";
          };
	  
          "hyprland/workspaces" = {
            format = "{icon}";
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

          "custom/i-lov-mari" = {
            format = "I Lov Mari";
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

          "mpris" = {
            format = "| {status_icon} {dynamic} {player_icon}";
            format-paused = "| {status_icon} <i>{dynamic}</i> {player_icon}";
            player = "playerctld";
            player-icons = {
              mpv = "";  
              spotify = "";
              brave = "";
            };
            status-icons = {
              paused = "";
              playing = "";
            };  
            dynamic-len = 15;
            ellipsis = "...";
            on-click = "playerctl play-pause";
            on-click-middle = "playerctl previous";
            on-click-right = "playerctl next";
          };  
            
          "clock" = {
	    format = "{:%I:%M:%S %p}";
	    interval = 1;
            tooltip-format = "<tt>{calendar}</tt>";
            calendar = {
              format = {
                today = "<span color='#fAfBfC'><b>{}</b></span>";
              };
            };
            actions = {
              on-click-right = "shift_down";
              on-click = "shift_up";
            };
	  };

          "pulseaudio" = {
            format = "{volume}% {icon}";
            format-icons = [
              ""
              ""
            ];
            format-muted = "";
            scroll-step = 2;
            on-click = "pavucontrol";
            tooltip = false;
          };        

          "pulseaudio/slider" = {
            min = 0;
            max = 50;
            orientation = "horizontal";
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
	    tooltip-format-disconnected = "Disconnected";
	    tooltip-format-wifi = "{essid} ({signalStrength}%) ";
	    tooltip-format-ethernet = "{ifname} ";
	    on-click = "kitty nmtui";
	  };

          "bluetooth" = {
            format-on = "󰂯";
            format-off = "BT-off";
            format-disabled = "󰂲";
            format-connected-battery = "{device_battery_percentage}% 󰂯";
            format-alt = "{device_alias} 󰂯";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
            on-click-right = "blueman-manager";
          };          

          "battery" = {
            interval = 30;
            states = {
              good = 95;
              warning = 30;
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

          "custom/expand" = {
	    format = "";
	    tooltip = "Show Tray";
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
	      "custom/i-lov-mari"
              #"cpu"
	      #"memory"
	      #"temperature"
              "tray"
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
	  font-family: "SF Pro Display", "JetBrainsMono Nerd Font Propo";
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
	  background: rgba(30, 30, 46, 0.8);
	}

	.modules-center {
	  padding:7px;
	  margin:10 0 5 0;
	  border-radius:10px;
	  background: rgba(30, 30, 46, 0.8);
	}
        
        .modules-right {
	  padding:7px;
	  margin: 10 10 5 0;
	  border-radius:10px;
	  background: rgba(30, 30, 46, 0.8);
	}  

	tooltip {
	  background:rgba(30, 30, 46, 0.5);
	  color: @color7;
	}

        #custom-i-lov-mari {
          padding: 0px 5px;
          transition: all .3s ease;
          color: @color7;
        }  

        #custom-nixos {
          padding: 0px 5px;
          transition: all .3s ease;
          color: rgba(116, 199, 236, 1);
        }

        #custom-nixos:hover {
          color: rgba(0, 0, 0, 0);
          transition: all .3s ease;
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

        #pulseaudio-slider slider {
          padding: 0px 0px;
          transition: all .3s ease;
          min-height: 0px;
          min-width: 0px;
          border: none;
          box-shadow: none;
          background-color: white;
        }

        #pulseaudio-slider trough {
          padding: 0px 0px;
          transition: all .3s ease;
          min-height: 10px;
          min-width: 100px;
          border-radius: 5px;
          background-color: rgba(30, 30, 46, 1);
        }

        #pulseaudio-slider highlight {
          padding: 0px 0px;
          transition: all .3s ease;
          min-width: 10px;
          border-radius: 5px;
          background-color: rgba(203, 166, 247, 1);
        }

	#workspaces {
	  padding: 0px 5px;
	}

	#workspaces button {
	  padding: 0px 5px;
	  transition: all .2s ease;
          color: white;
	}

        #workspaces button:hover {
          color: rgba(255, 255, 255, 0.3);
          transition: all 1s ease;
        }  

	#workspaces button.active {
          padding: 0px 5px;
	  color: rgba(203, 166, 247, 1);
	}

        #workspaces button.empty {
	  color: rgba(108, 112, 134, 1);
	}

	#workspaces button.empty.active {
	  color: rgba(203, 166, 247, 1);
	}

        #cava {
          padding: 0px 5px;
          transition: all .3s ease;
          color: @color7;
        }  

        #mpris {
          padding: 0px 5px;
          transition: all .3s ease;
          color: @color7;
        }  

	#network {
	  padding: 0px 5px;
	  transition: all .3s ease;
	  color:@color7;
	}

        #bluetooth {
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;
        }

        #battery {
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;
        }

        #battery.charging {
          color: #26A65B;
        }

        #battery.warning:not(.charging) {
          color: #ffbe61;
        }

        #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
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
      # So Go Check Them Out!

    };  
  };
  };
}
