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
            transition: all .3s ease;
          }

          window {
            background-size: 100%;
            background-color: rgba(0, 0, 0, 0.4);
          }

          button {
            color: #${config.lib.stylix.colors.base05};
            font-size:20px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
            border-style: solid;
            background-color: #${config.stylix.base16Scheme.base00};
            border: none;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            transition: all .3s ease;
          }

          button:focus,
          button:active,
          button:hover {
            color: #${config.lib.stylix.colors.base05};
            background-color: #${config.stylix.base16Scheme.base01};
            border: none;
            border-radius: 20px;
            transition: all .3s ease;
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

      home.file.".config/wlogout/icons" = {
        source = ./icons;
        recursive = true;
      };

    };
  };
}   
