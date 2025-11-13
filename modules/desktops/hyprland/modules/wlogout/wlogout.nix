{ pkgs, lib, config, ... }:

{
  options = {
    wlogout.enable = 
      lib.mkEnableOption "enables wlogout";
  };
  
  config = lib.mkIf config.wlogout.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {

      programs.wlogout = {
        enable = true;
        
        layout = [
          { #>>> Lock:
            label = "lock"; 
            action = "hyprlock"; 
            text = "Lock"; 
            keybind = "L";
          }
          { #>>> Hibernate:
            label = "hibernate"; 
            action = "systemctl hibernate"; 
            text = "Hibernate"; 
            keybind = "H";
          }
          { #>>> Logout:
            label = "logout"; 
            action = "loginctl terminate-user $USER"; 
            text = "Logout"; 
            keybind = "E";
          }
          { #>>> Shutdown:
            label = "shutdown"; 
            action = "systemctl poweroff"; 
            text = "Shutdown"; 
            keybind = "S";
          }
          { #>>> Suspend:
            label = "suspend"; 
            action = "systemctl suspend"; 
            text = "Suspend"; 
            keybind = "U";
          }
          { #>>> Reboot:
            label = "reboot"; 
            action = "systemctl reboot"; 
            text = "Reboot"; 
            keybind = "R";
          }
        ];

        style = ''

          * {
            font-family: "JetBrainsMono NF", FontAwesome, sans-serif;
          	background-image: none;
          	transition: 20ms;
          }

          window {
          	background-color: rgba(12, 12, 12, 0.1);
          }

          button {
          	color: #${config.lib.stylix.colors.base05};
            font-size:20px;
            background-repeat: no-repeat;
          	background-position: center;
          	background-size: 25%;
          	border-style: solid;
          	background-color: rgba(12, 12, 12, 0.3);
          	border: 3px solid #${config.lib.stylix.colors.base05};
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          }

          button:focus,
          button:active,
          button:hover {
            color: #${config.lib.stylix.colors.base0B};
            background-color: rgba(12, 12, 12, 0.5);
            border: 3px solid #${config.lib.stylix.colors.base0B};
          }

          #logout {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/logout.png"));
          }

          #suspend {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/suspend.png"));
          }

          #shutdown {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/shutdown.png"));
          }

          #reboot {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/reboot.png"));
          }

          #lock {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/lock.png"));
          }

          #hibernate {
          	margin: 10px;
          	border-radius: 20px;
          	background-image: image(url("icons/hibernate.png"));
          }

        '';
      };

    };
  };
}   
