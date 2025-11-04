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
            "custom/separator"
            "custom/previous"
            "mpris"
            "custom/next"
            "custom/separator"
            "group/expand-right"
          ];
	  modules-center = [
            "cava"
            "custom/separator"
            "clock"
            #"hyprland/workspaces#ws2"
            "custom/separator"
            "cava"
	  ];  
	  modules-right = [ 
            "group/expand-left"
            "custom/separator"
            "pulseaudio"
            "custom/separator"
            "network"
            "custom/separator"
            "battery"
            "custom/swaync"
            "custom/separator"
            "group/power"
	  ];

	   # Modules:

          "custom/space" = {
            format = "  ";
            tooltip = false;
          };  

          "custom/separator" = {
            format = "|";
            tooltip = false;
          };  

          "clock" = {
            format = " {:%I:%M %p}";
            format-alt = " 󰸘 {:%a, %d %b |  %I:%M %p}";
            interval = 1;
            tooltip = false;
          };

          "custom/swaync" = {
            format = "";
            tooltip = false;
            on-click = "swaync-client --open-panel";
          };  

          "hyprland/workspaces" = {
            ws = "WS1";
            format = "{name}";
            format-icons = {
              #active = "";
              active = "";
              default = "";
              empty = "";
            };  
            persistent-workspaces = {
              "*" = 5;
              #"DP-3" = ["1" "2" "3" "4" "5"];
            };  
          };

          "hyprland/workspaces#ws2" = {
            ws = "WS2";
            format = "{name}";
            format-icons = {
              #active = "";
              active = "";
              default = "";
              empty = "";
            };  
            persistent-workspaces = {
              "HDMI-A-1" = ["6" "7" "8" "9" "10"];
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
            reverse = true;
            rotate = 180;
          };

          "mpris" = {
            #format = "| {status_icon} {title}-{artist}-{album} {player_icon}";
            #format-paused = "| {status_icon} <i>{dynamic}</i> {player_icon}";
            format = "{status_icon}";
            format-paused = "{status_icon}";
            player = "playerctld";
            player-icons = {
              mpv = "";  
              spotify = "";
              brave = "";
              zen-twilight = "";
            };
            status-icons = {
              paused = "";
              playing = "";
            };  
            "[format]-len" = 15;
            ellipsis = "...";
            on-click = "playerctl play-pause";
            #on-click-middle = "playerctl previous";
            #on-click-right = "playerctl next";
          };

          "custom/previous" = {
            format = "";
            on-click = "playerctl previous";
            tooltip = false;
          };  

          "custom/next" = {
            format = "";
            on-click-right = "playerctl next";
            tooltip = false;
          };  

          "pulseaudio" = {
            format = "{icon} {volume}%";
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

          "user" = {
            format = "{user} Up {work_H}:{work_M}h";
            avatar = "$HOME/Pictures/Pfps/emilia.png";
            height = 30;
            width = 30;
            icon = true;
          };

          "custom/expand-right" = {
            format = "";
            #format-alt = "";
            tooltip = false;
          };

          "custom/endpoint-right" = {
            format = "|";
            tooltip = false;
          };

          "tray" = {
            tooltip = false;
            spacing = 5;
          };  

          "group/expand-right" = {
	    orientation = "horizontal";
	    drawer = {
	      transition-duration = 600;
	      transition-left-to-right = true;
	      click-to-reveal = false;
	    };
	    modules = [
              "custom/expand-right"
              "tray"
              #"custom/endpoint-right"
            ];
          };

          "custom/expand-left" = {
            format = "";
            #format-alt = "";
            tooltip = false;
          };

          "custom/endpoint-left" = {
            format = "|";
            tooltip = false;
          };

          "group/expand-left" = {
	    orientation = "horizontal";
	    drawer = {
	      transition-duration = 600;
	      transition-left-to-right = false;
	      click-to-reveal = false;
	    };
	    modules = [
              "custom/expand-left"
              #"custom/endpoint-left"
            ];
          };

          "group/power" = {
	    orientation = "horizontal";
	    drawer = {
	      transition-duration = 600;
	      transition-left-to-right = false;
	      click-to-reveal = false;
	    };
	    modules = [
              "custom/power"
              "custom/quit"
              "custom/lock"
              "custom/reboot"
            ];
          };

          "custom/quit" = {
            format = "󰗼";
            tooltip = false;
            on-click = "hyprctl dispatch exit";
          };
          
          "custom/lock" = {
            format = "󰍁";
            tooltip = false;
            on-click = "hyprlock";
          };
          
          "custom/reboot" = {
            format = "󰜉";
            tooltip = false;
            on-click = "reboot";
          };
          
          "custom/power" = {
            format = "";
            tooltip = false;
            on-click = "shutdown now";
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
          background-color: #${config.stylix.base16Scheme.base00};
	}

	.modules-center {
          padding:7px;
          margin:0;
          border-radius:0px 0 10px 10px;
          background-color: #${config.stylix.base16Scheme.base00};
	}
        
        .modules-right {
          padding:7px;
          margin:0;
          border-radius:0px 0px 0px 10px;
          background-color: #${config.stylix.base16Scheme.base00};
	}  

	tooltip {
	}
        
        #custom-space {
          padding: 0px 5px;
          background-color: transparent;
        }  

        #custom-separator {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
        }

        #clock {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          background-color: transparent;
          transition: all .3s ease;
        }  

        #clock:hover {
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base04};
        }  

        #custom-swaync {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          transition: all .3s ease;
        }

        #custom-swaync:hover {
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base04};
        }  

        #workspaces {
          padding: 0px 5px;
        }  

        #workspaces button {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          background-color: transparent;
          transition: all .3s ease;
        } 

        #workspaces button:hover {
          background-color: #${config.stylix.base16Scheme.base02};
          color: #${config.stylix.base16Scheme.base04};
        }  

	#workspaces button.active {
          padding: 0px 5px;
	  background-color: #${config.stylix.base16Scheme.base0E};
          color: #${config.stylix.base16Scheme.base01};
        }

        #workspaces button.empty {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base03};
        } 

        #workspaces button.empty:hover {
          color: #${config.stylix.base16Scheme.base02};
          color: #${config.stylix.base16Scheme.base04};
        }  

	#workspaces button.empty.active {
          background-color: #${config.stylix.base16Scheme.base07};
	  color: #${config.stylix.base16Scheme.base00};
	}

        #cava {
          padding: 0px 5px;
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base05};
          background-color: transparent;
        }

        #mpris {
          padding: 0px 5px;
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base0E};
          font-size: 20px;
        }  

        #mpris:hover {
          transition: all .8s linear;
          color: rgb(122, 100, 148);
        }  

        #custom-previous {
          padding: 0px 5px;
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base0E};
          font-size: 20px;
        }

        #custom-previous:hover {
          transition: all .8s linear;
          color: rgb(122, 100, 148);
        }  

        #custom-next {
          padding: 0px 5px;
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base0E};
          font-size: 20px;
        }  

        #custom-next:hover {
          transition: all .8s linear;
          color: rgb(122, 100, 148);
        }  

	#network {
	  padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
	  transition: all .3s ease;
	}

        #network:hover {
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base04};
        }

        #battery {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          transition: all .3s ease;
        }

        #battery:hover {
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base04};
        }  

        #battery.charging {
          color: #${config.stylix.base16Scheme.base0B};
        }

        #battery.warning:not(.charging) {
          color: #${config.stylix.base16Scheme.base0A};
        }

        #battery.critical:not(.charging) {
          color: #${config.stylix.base16Scheme.base08};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }   

        #pulseaudio {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          transition: all .3s ease;
        } 

        #pulseaudio:hover {
          transition: all .3s ease;
          color: #${config.stylix.base16Scheme.base04};
        }  

        #user {
          padding: 0px 5px;
          transition: all .3s ease;
        }  

        #group-expand-right {
          padding: 0px 5px;
          transition: all .3s ease;
        }

        #custom-expand-right {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          transition: all .3s ease;
        } 

        #custom-expand-right:hover {
          color: #${config.stylix.base16Scheme.base04};
        }

	#custom-endpoint-right {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
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

        #group-expand-right {
          padding: 0px 5px;
          transition: all .3s ease;
        }

        #custom-expand-left {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
          transition: all .3s ease;
        } 

        #custom-expand-left:hover {
          color: #${config.stylix.base16Scheme.base04};
        }

	#custom-endpoint-left {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base05};
	}

        #group-power {
          padding: 0px 5px;
          transition: all .3s ease;
        }  

        #custom-quit {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base0F};
          font-size: 20px;
          transition: all .3s ease;
        }  

        #custom-quit:hover {
          transition: all .3s ease;
        }  
        
        #custom-lock {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base0A};
          font-size: 20px;
          transition: all .3s ease;
        }

        #custom-lock:hover {
          transition: all .3s ease;
        }  

        #custom-reboot {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base09};
          font-size: 20px;
          transition: all .3s ease;
        }

        #custom-reboot:hover {
          transition: all .3s ease;
        }  

        #custom-power {
          padding: 0px 5px;
          color: #${config.stylix.base16Scheme.base08};
          font-size: 18px;
          transition: all .3s ease;
        }  

        #custom-power:hover {
          transition: all .3s ease;
        }  

      '';

    };  
  };
  };
}
